require "test_helper"

class DeviseMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:one)
  end

  test "confirmation_instructions sends email to user" do
    email = Devise::Mailer.confirmation_instructions(@user, "faketoken")

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [@user.email], email.to
    assert_match "confirmation", email.subject.downcase
  end

  test "confirmation_instructions includes confirmation token" do
    token = "test_confirmation_token"
    email = Devise::Mailer.confirmation_instructions(@user, token)

    assert_match token, email.body.encoded
  end

  test "reset_password_instructions sends email to user" do
    email = Devise::Mailer.reset_password_instructions(@user, "faketoken")

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [@user.email], email.to
    assert_match "password", email.subject.downcase
  end

  test "reset_password_instructions includes reset token" do
    token = "test_reset_token"
    email = Devise::Mailer.reset_password_instructions(@user, token)

    assert_match token, email.body.encoded
  end

  test "unlock_instructions sends email to user" do
    email = Devise::Mailer.unlock_instructions(@user, "faketoken")

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [@user.email], email.to
    assert_match "unlock", email.subject.downcase
  end

  test "unlock_instructions includes unlock token" do
    token = "test_unlock_token"
    email = Devise::Mailer.unlock_instructions(@user, token)

    assert_match token, email.body.encoded
  end

  test "email_changed notification sends to user" do
    email = Devise::Mailer.email_changed(@user)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [@user.email], email.to
    assert_match "email", email.subject.downcase
  end

  test "password_change notification sends to user" do
    email = Devise::Mailer.password_change(@user)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal [@user.email], email.to
    assert_match "password", email.subject.downcase
  end
end
