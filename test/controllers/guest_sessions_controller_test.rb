require "test_helper"

class GuestSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @creator = users(:one)
  end

  test "create redirects with alert for invalid token" do
    assert_no_difference("User.count") do
      post guest_session_path, params: { token: "not-a-real-token" }
    end

    assert_redirected_to root_path
    assert_equal "Invalid invitation link", flash[:alert]
  end

  test "create redirects when token is already used" do
    token = create_invitation_token(used_at: 1.hour.ago)

    post guest_session_path, params: { token: token.token }

    assert_redirected_to root_path
    assert_match(/already been used/i, flash[:alert])
  end

  test "create redirects when token is expired" do
    token = create_invitation_token(admin_expires_at: 1.hour.ago)

    post guest_session_path, params: { token: token.token }

    assert_redirected_to root_path
    assert_match(/has expired/i, flash[:alert])
  end

  test "create builds a temporary admin for a new invited email and marks token used" do
    email = "temp-admin-#{SecureRandom.hex(6)}@example.com"
    token = create_invitation_token(email: email, admin_expires_at: 6.hours.from_now)

    assert_difference("User.count", 1) do
      post guest_session_path, params: { token: token.token }
    end

    assert_redirected_to mushrooms_path
    assert_match(/full admin access until/i, flash[:notice])

    invited_user = User.find_by!(email: email)
    assert_equal 2, invited_user.permission_id
    assert invited_user.temporary_admin?
    assert_not_nil invited_user.confirmed_at

    token.reload
    assert token.used?
    assert_equal invited_user.id, token.invited_user_id
  end

  test "create upgrades existing user to temporary admin and reuses account" do
    existing_user = users(:two)
    token = create_invitation_token(email: existing_user.email, admin_expires_at: 8.hours.from_now)

    assert_no_difference("User.count") do
      post guest_session_path, params: { token: token.token }
    end

    assert_redirected_to mushrooms_path

    existing_user.reload
    assert_equal 2, existing_user.permission_id
    assert existing_user.temporary_admin?
    assert_in_delta token.admin_expires_at.to_i, existing_user.admin_expires_at.to_i, 1

    token.reload
    assert token.used?
    assert_equal existing_user.id, token.invited_user_id
  end

  private

  def create_invitation_token(attributes = {})
    InvitationToken.create!(
      {
        email: "invitee-#{SecureRandom.hex(4)}@example.com",
        token: SecureRandom.urlsafe_base64(32),
        created_by: @creator,
        admin_expires_at: 12.hours.from_now
      }.merge(attributes)
    )
  end
end
