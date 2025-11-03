# test/models/user_test.rb
require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @admin_user = users(:one) # permission_id: 1
    @member_user = users(:two) # permission_id: 9
  end

  # === Validations ===

  test "should be valid with valid attributes" do
    assert @user.valid?
  end

  test "should require email" do
    @user.email = nil
    assert_not @user.valid?
    assert_includes @user.errors[:email], "can't be blank"
  end

  test "should validate email format" do
    invalid_emails = ["invalid", "invalid@", "@example.com", "invalid@example"]
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email} should be invalid"
    end
  end

  test "should accept valid email formats" do
    valid_emails = ["user@example.com", "USER@example.COM", "user+tag@example.co.uk"]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{valid_email} should be valid"
    end
  end

  test "should enforce unique emails" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    assert_not duplicate_user.valid?
    assert_includes duplicate_user.errors[:email], "has already been taken"
  end

  test "should require password on create" do
    user = User.new(email: "new@example.com")
    assert_not user.valid?
    assert_includes user.errors[:password], "can't be blank"
  end

  test "should validate password minimum length" do
    user = User.new(email: "new@example.com", password: "short", password_confirmation: "short")
    assert_not user.valid?
    assert_includes user.errors[:password], "is too short (minimum is 6 characters)"
  end

  # === Associations ===

  test "should belong to permission optionally" do
    assert_respond_to @user, :permission
    @user.permission = nil
    assert @user.valid?, "User should be valid without permission"
  end

  test "should have many mushrooms" do
    assert_respond_to @user, :mushrooms
    assert_instance_of Mushroom, @user.mushrooms.first if @user.mushrooms.any?
  end

  test "should destroy associated mushrooms when user is destroyed" do
    user = User.create!(email: "test@example.com", password: "password", confirmed_at: Time.current)
    mushroom = user.mushrooms.create!(
      name: "Test Mushroom",
      country: countries(:one),
      fungus_type: fungus_types(:one)
    )

    assert_difference "Mushroom.count", -1 do
      user.destroy
    end
  end

  test "should have many all_groups" do
    assert_respond_to @user, :all_groups
  end

  test "should destroy associated all_groups when user is destroyed" do
    user = User.create!(email: "test2@example.com", password: "password", confirmed_at: Time.current)
    user.all_groups.create!(name: "Test Group")

    assert_difference "AllGroup.count", -1 do
      user.destroy
    end
  end

  test "should have many clusters" do
    assert_respond_to @user, :clusters
  end

  test "should destroy associated clusters when user is destroyed" do
    user = User.create!(email: "test3@example.com", password: "password", confirmed_at: Time.current)
    user.clusters.create!(name: "Test Cluster")

    assert_difference "Cluster.count", -1 do
      user.destroy
    end
  end

  test "should have many projects" do
    assert_respond_to @user, :projects
  end

  test "should destroy associated projects when user is destroyed" do
    user = User.create!(email: "test4@example.com", password: "password", confirmed_at: Time.current)
    user.projects.create!(name: "Test Project")

    assert_difference "Project.count", -1 do
      user.destroy
    end
  end

  test "should have many user_roles" do
    assert_respond_to @user, :user_roles
  end

  test "should have many roles through user_roles" do
    assert_respond_to @user, :roles
  end

  # === Devise Modules ===

  test "should respond to devise methods" do
    assert_respond_to @user, :valid_password?
    assert_respond_to @user, :remember_me
    assert_respond_to @user, :confirmed?
    assert_respond_to @user, :locked?
  end

  test "should authenticate with valid password" do
    user = User.create!(
      email: "auth@example.com",
      password: "password123",
      password_confirmation: "password123",
      confirmed_at: Time.current
    )
    assert user.valid_password?("password123")
    assert_not user.valid_password?("wrongpassword")
  end

  # === Two-Factor Authentication ===

  test "should generate otp_secret on create" do
    user = User.new(email: "otp@example.com", password: "password", confirmed_at: Time.current)
    assert_nil user.otp_secret

    user.save!
    assert_not_nil user.otp_secret
  end

  test "should not overwrite existing otp_secret" do
    user = User.create!(
      email: "otp2@example.com",
      password: "password",
      confirmed_at: Time.current,
      otp_secret: "existing_secret"
    )
    assert_equal "existing_secret", user.otp_secret
  end

  test "should generate otp provisioning uri" do
    user = User.create!(email: "otp3@example.com", password: "password", confirmed_at: Time.current)
    uri = user.otp_provisioning_uri

    assert_not_nil uri
    assert_includes uri, "otpauth://totp/"
    assert_includes uri, user.email
    assert_includes uri, "MRDBID"
    assert_includes uri, user.otp_secret
  end

  test "should return nil for otp provisioning uri when otp_secret is blank" do
    user = User.new(email: "otp4@example.com", password: "password")
    user.otp_secret = nil
    assert_nil user.otp_provisioning_uri
  end

  test "should generate otp backup codes" do
    user = User.create!(email: "backup@example.com", password: "password", confirmed_at: Time.current)
    codes = user.generate_otp_backup_codes!

    assert_equal 10, codes.length
    codes.each do |code|
      assert_match(/\A[a-z0-9]{4}-[a-z0-9]{4}\z/, code, "Backup code should match format: xxxx-xxxx")
    end
  end

  test "should return empty array for otp_backup_codes when nil" do
    user = User.new(email: "backup2@example.com", password: "password")
    user.otp_backup_codes = nil
    assert_equal [], user.otp_backup_codes
  end

  test "should store otp_backup_codes as array" do
    user = User.create!(email: "backup3@example.com", password: "password", confirmed_at: Time.current)
    codes = ["test1", "test2"]
    user.otp_backup_codes = codes

    assert user.otp_backup_codes.is_a?(Array)
    assert_equal 2, user.otp_backup_codes.length
  end

  # === Business Logic ===

  test "admin? should return true for permission_id less than 5" do
    [1, 2, 3, 4].each do |permission_id|
      @user.permission_id = permission_id
      assert @user.admin?, "User with permission_id #{permission_id} should be admin"
    end
  end

  test "admin? should return false for permission_id 5 or greater" do
    [5, 6, 7, 8, 9].each do |permission_id|
      @user.permission_id = permission_id
      assert_not @user.admin?, "User with permission_id #{permission_id} should not be admin"
    end
  end

  test "admin? should return false when permission_id is nil" do
    @user.permission_id = nil
    assert_not @user.admin?
  end

  test "should save timestamps" do
    user = User.create!(email: "timestamp@example.com", password: "password", confirmed_at: Time.current)
    assert_not_nil user.created_at
    assert_not_nil user.updated_at
  end

  # === Edge Cases ===

  test "should handle very long email" do
    @user.email = "a" * 244 + "@example.com" # 256 chars
    assert_not @user.valid?
  end

  test "should trim whitespace from email" do
    user = User.new(email: "  spaces@example.com  ", password: "password")
    user.save
    assert_equal "spaces@example.com", user.email
  end

  test "should be case insensitive for email uniqueness" do
    User.create!(email: "Case@Example.Com", password: "password", confirmed_at: Time.current)
    duplicate = User.new(email: "case@example.com", password: "password")
    assert_not duplicate.valid?
  end
end
