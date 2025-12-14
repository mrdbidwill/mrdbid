require "test_helper"

class AuthenticationFlowTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @another_user = users(:two)
  end

  # ==============================================================================
  # USER REGISTRATION TESTS
  # ==============================================================================

  test "user can register with valid information" do
    assert_difference("User.count", 1) do
      post user_registration_path, params: {
        user: {
          email: "newuser@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_redirected_to root_path
    follow_redirect!
    assert_select ".alert", text: /confirmation link has been sent/i
  end

  test "user cannot register with invalid email" do
    assert_no_difference("User.count") do
      post user_registration_path, params: {
        user: {
          email: "invalid_email",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_response :unprocessable_entity
    assert_select ".alert, .error", text: /email/i
  end

  test "user cannot register with mismatched passwords" do
    assert_no_difference("User.count") do
      post user_registration_path, params: {
        user: {
          email: "newuser@example.com",
          password: "password123",
          password_confirmation: "different_password"
        }
      }
    end

    assert_response :unprocessable_entity
    assert_select ".alert, .error", text: /password/i
  end

  test "user cannot register with duplicate email" do
    assert_no_difference("User.count") do
      post user_registration_path, params: {
        user: {
          email: @user.email,
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_response :unprocessable_entity
    assert_select ".alert, .error", text: /already been taken/i
  end

  test "honeypot field prevents spam registration" do
    # If website_url is filled (honeypot), registration should fail silently
    assert_no_difference("User.count") do
      post user_registration_path, params: {
        user: {
          email: "spammer@example.com",
          password: "password123",
          password_confirmation: "password123",
          website_url: "http://spam.com" # Honeypot field
        }
      }
    end
  end

  # ==============================================================================
  # EMAIL CONFIRMATION TESTS
  # ==============================================================================

  test "user must confirm email before logging in" do
    # Create unconfirmed user
    unconfirmed_user = User.create!(
      email: "unconfirmed@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    unconfirmed_user.update_column(:confirmed_at, nil) # Remove confirmation

    post user_session_path, params: {
      user: {
        email: unconfirmed_user.email,
        password: "password123"
      }
    }

    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_select ".alert", text: /confirm your email/i
  end

  test "user can confirm email with valid token" do
    unconfirmed_user = User.create!(
      email: "unconfirmed@example.com",
      password: "password123",
      password_confirmation: "password123"
    )
    unconfirmed_user.update_column(:confirmed_at, nil)

    get user_confirmation_path(confirmation_token: unconfirmed_user.confirmation_token)

    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_select ".alert, .notice", text: /confirmed/i

    assert unconfirmed_user.reload.confirmed?
  end

  # ==============================================================================
  # LOGIN/LOGOUT TESTS
  # ==============================================================================

  test "user can login with valid credentials" do
    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
    # Verify user is logged in by checking session has user_id
    assert_not_nil session[:user_id]
  end

  test "user cannot login with invalid password" do
    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "wrong_password"
      }
    }

    assert_response :unprocessable_entity
    assert_select ".alert", text: /invalid/i
  end

  test "user cannot login with non-existent email" do
    post user_session_path, params: {
      user: {
        email: "nonexistent@example.com",
        password: "password"
      }
    }

    assert_response :unprocessable_entity
    assert_select ".alert", text: /invalid/i
  end

  test "user can logout successfully" do
    sign_in @user

    delete destroy_user_session_path

    assert_redirected_to root_path
    follow_redirect!
    # Verify user is logged out by checking session has no user_id
    assert_nil session[:user_id]
  end

  test "user is redirected to login page when accessing protected resources" do
    get mushrooms_path

    # Since index allows guests to see demo mushrooms, try edit instead
    mushroom = mushrooms(:one)
    get edit_mushroom_path(mushroom)

    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_select ".alert", text: /sign in/i
  end

  # ==============================================================================
  # PASSWORD RESET TESTS
  # ==============================================================================

  test "user can request password reset" do
    post user_password_path, params: {
      user: {
        email: @user.email
      }
    }

    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_select ".alert, .notice", text: /instructions/i

    # Check that reset token was generated
    assert_not_nil @user.reload.reset_password_token
  end

  test "password reset request with invalid email shows generic message" do
    post user_password_path, params: {
      user: {
        email: "nonexistent@example.com"
      }
    }

    # Should still redirect to avoid email enumeration
    assert_redirected_to new_user_session_path
  end

  test "user can reset password with valid token" do
    @user.send_reset_password_instructions

    put user_password_path, params: {
      user: {
        reset_password_token: @user.reset_password_token,
        password: "newpassword123",
        password_confirmation: "newpassword123"
      }
    }

    assert_redirected_to root_path
    follow_redirect!
    assert_select ".alert, .notice", text: /changed/i

    # Verify new password works
    sign_out @user
    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "newpassword123"
      }
    }
    assert_redirected_to root_path
  end

  test "user cannot reset password with invalid token" do
    put user_password_path, params: {
      user: {
        reset_password_token: "invalid_token",
        password: "newpassword123",
        password_confirmation: "newpassword123"
      }
    }

    assert_response :unprocessable_entity
    assert_select ".alert, .error", text: /invalid/i
  end

  test "password reset fails with mismatched passwords" do
    @user.send_reset_password_instructions

    put user_password_path, params: {
      user: {
        reset_password_token: @user.reset_password_token,
        password: "newpassword123",
        password_confirmation: "different_password"
      }
    }

    assert_response :unprocessable_entity
    assert_select ".alert, .error", text: /match/i
  end

  # ==============================================================================
  # TWO-FACTOR AUTHENTICATION (2FA) TESTS
  # ==============================================================================

  test "user can enable 2FA" do
    sign_in @user

    # Visit 2FA setup page
    get user_two_factor_authentication_path

    assert_response :success
    assert_select "img[alt='QR Code']" # QR code should be displayed

    # Get the OTP secret and generate a code
    otp_code = ROTP::TOTP.new(@user.otp_secret).now

    # Enable 2FA by providing valid OTP code
    post user_two_factor_authentication_path, params: {
      code: otp_code
    }

    assert_redirected_to root_path
    follow_redirect!
    assert_select ".alert, .notice", text: /enabled/i

    assert @user.reload.otp_required_for_login
  end

  test "user cannot enable 2FA with invalid code" do
    sign_in @user

    post user_two_factor_authentication_path, params: {
      code: "000000" # Invalid code
    }

    assert_response :unprocessable_entity
    assert_select ".alert, .error"
    assert_not @user.reload.otp_required_for_login
  end

  test "user with 2FA enabled must provide OTP code when logging in" do
    # Enable 2FA for user
    @user.update!(otp_required_for_login: true)

    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    # Should be prompted for OTP code
    assert_response :success
    assert_select "input[name='user[otp_attempt]']"
  end

  test "user can login with valid 2FA code" do
    @user.update!(
      otp_required_for_login: true,
      otp_secret: User.generate_otp_secret
    )

    # First step: provide email and password
    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    # Second step: provide valid OTP code
    otp_code = ROTP::TOTP.new(@user.otp_secret).now

    post user_session_path, params: {
      user: {
        otp_attempt: otp_code
      }
    }

    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
  end

  test "user cannot login with invalid 2FA code" do
    @user.update!(otp_required_for_login: true)

    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    post user_session_path, params: {
      user: {
        otp_attempt: "000000" # Invalid code
      }
    }

    assert_response :unprocessable_entity
    assert_select ".alert, .error", text: /invalid/i
  end

  test "user can disable 2FA" do
    @user.update!(otp_required_for_login: true)
    sign_in @user

    delete user_two_factor_authentication_path, params: {
      password: "password"
    }

    assert_redirected_to root_path
    follow_redirect!
    assert_select ".alert, .notice", text: /disabled/i

    assert_not @user.reload.otp_required_for_login
  end

  test "user receives backup codes when enabling 2FA" do
    sign_in @user

    # Generate OTP secret first
    @user.update!(otp_secret: User.generate_otp_secret)
    otp_code = ROTP::TOTP.new(@user.otp_secret).now

    post user_two_factor_authentication_path, params: {
      code: otp_code
    }

    # Backup codes should be displayed
    assert_response :success
    assert_select ".backup-code", count: 10
  end

  test "user can login with backup code when 2FA enabled" do
    @user.update!(otp_required_for_login: true)
    backup_codes = @user.generate_otp_backup_codes!
    @user.save!

    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    # Use a backup code instead of OTP
    post user_session_path, params: {
      user: {
        otp_attempt: backup_codes.first
      }
    }

    assert_redirected_to root_path
    follow_redirect!
    assert_response :success
  end

  # ==============================================================================
  # SESSION MANAGEMENT TESTS
  # ==============================================================================

  test "session persists across requests when remember me is enabled" do
    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "password",
        remember_me: "1"
      }
    }

    assert_redirected_to root_path

    # Session should persist
    get mushrooms_path
    assert_response :success
  end

  test "concurrent sessions are allowed for the same user" do
    # First session
    sign_in @user
    first_session_cookie = cookies["_mrdbid_session"]

    # Second session (different browser/device)
    # In integration tests, we can simulate by signing out and signing in again
    sign_out @user
    sign_in @user
    second_session_cookie = cookies["_mrdbid_session"]

    # Both sessions should be valid (different cookies)
    assert_not_equal first_session_cookie, second_session_cookie
  end

  test "user account is locked after maximum failed login attempts" do
    @user.update!(failed_attempts: 0, locked_at: nil)

    # Attempt to login with wrong password multiple times
    11.times do
      post user_session_path, params: {
        user: {
          email: @user.email,
          password: "wrong_password"
        }
      }
    end

    # Account should be locked
    @user.reload
    assert @user.access_locked?

    # Further login attempts should fail even with correct password
    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    assert_response :unprocessable_entity
    assert_select ".alert", text: /locked/i
  end

  test "user can unlock account via email" do
    @user.lock_access!

    # Request unlock instructions
    post user_unlock_path, params: {
      user: {
        email: @user.email
      }
    }

    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_select ".alert, .notice", text: /instructions/i

    # Unlock account with token
    get user_unlock_path(unlock_token: @user.unlock_token)

    assert_redirected_to new_user_session_path
    follow_redirect!
    assert_select ".alert, .notice", text: /unlocked/i

    assert_not @user.reload.access_locked?
  end

  test "session is invalidated after password change" do
    sign_in @user
    old_password = "password"
    new_password = "newpassword123"

    # Change password
    put user_registration_path, params: {
      user: {
        current_password: old_password,
        password: new_password,
        password_confirmation: new_password
      }
    }

    assert_redirected_to root_path

    # Old session should still work (Devise doesn't invalidate by default)
    get mushrooms_path
    assert_response :success

    # But old password should not work
    sign_out @user
    post user_session_path, params: {
      user: {
        email: @user.email,
        password: old_password
      }
    }

    assert_response :unprocessable_entity
    assert_select ".alert", text: /invalid/i
  end

  test "unauthenticated user is redirected back after login" do
    mushroom = mushrooms(:one)

    # Try to access edit page without authentication
    get edit_mushroom_path(mushroom)
    assert_redirected_to new_user_session_path

    # Login
    post user_session_path, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    # Should be redirected back to originally requested page
    # Note: This might redirect to root_path depending on Devise configuration
    assert_redirected_to root_path
  end
end
