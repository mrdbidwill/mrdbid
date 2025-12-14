require "test_helper"

class DeviseMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:one)
  end

  test "password reset email can be generated" do
    # Test that password reset emails work
    @user.send_reset_password_instructions

    assert_not ActionMailer::Base.deliveries.empty?
    email = ActionMailer::Base.deliveries.last

    assert_equal [@user.email], email.to
    assert_match /password/i, email.subject
  end

  test "password change notification can be generated" do
    skip "Requires Devise mailer to be properly configured"
    # This would test password change notifications
    # but requires full Devise integration
  end

  test "email change notification can be generated" do
    skip "Requires Devise mailer to be properly configured"
    # This would test email change notifications
    # but requires full Devise integration
  end
end
