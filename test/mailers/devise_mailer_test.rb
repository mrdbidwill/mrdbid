require "test_helper"

class DeviseMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:one)
  end

  test "password reset email can be generated" do
    # Generate a reset password token
    token = @user.send(:set_reset_password_token)

    # Call the mailer directly
    email = DeviseMailer.reset_password_instructions(@user, token)

    assert_equal [@user.email], email.to
    assert_match /password/i, email.subject
  end

  test "password change notification can be generated" do
    email = DeviseMailer.password_change(@user)

    assert_equal [@user.email], email.to
    assert_match /password.*change/i, email.subject
  end

  test "email change notification can be generated" do
    email = DeviseMailer.email_changed(@user)

    assert_equal [@user.email], email.to
    assert_match /email.*change/i, email.subject
  end
end
