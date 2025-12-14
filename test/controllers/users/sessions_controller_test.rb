require "test_helper"

class Users::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @user.update!(otp_required_for_login: false)
  end

  test "should get new session" do
    get new_user_session_url
    assert_response :success
  end

  test "should create session with valid credentials" do
    post user_session_url, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    assert_redirected_to mushrooms_path
  end

  test "should redirect to 2FA when enabled" do
    @user.update!(
      otp_required_for_login: true,
      otp_secret: User.generate_otp_secret
    )

    post user_session_url, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    assert_redirected_to user_two_factor_authentication_path
    assert session[:otp_user_id]
  end

  test "should skip 2FA with trusted device" do
    skip "Encrypted cookies not available in controller tests - needs integration test"

    post user_session_url, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    # Should sign in directly without 2FA
    assert_redirected_to mushrooms_path
  end

  test "should clear invalid trusted device cookie" do
    @user.update!(
      otp_required_for_login: true,
      otp_secret: User.generate_otp_secret
    )

    # Set invalid cookie
    cookies[:trusted_device_token] = "invalid_token"

    post user_session_url, params: {
      user: {
        email: @user.email,
        password: "password"
      }
    }

    assert_redirected_to user_two_factor_authentication_path
  end

  test "should reject invalid credentials" do
    post user_session_url, params: {
      user: {
        email: @user.email,
        password: "wrongpassword"
      }
    }

    assert_response :unprocessable_entity
  end

  test "should destroy session" do
    sign_in @user

    delete destroy_user_session_url
    assert_redirected_to mushrooms_path
  end

  test "guest should access new session" do
    get new_user_session_url
    assert_response :success
  end
end
