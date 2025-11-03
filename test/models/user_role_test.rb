# test/models/user_role_test.rb
require "test_helper"

class UserRoleTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @role = roles(:admin)
    @user_role = UserRole.create!(user: @user, role: @role)
  end

  # === Validations ===

  test "should be valid with valid attributes" do
    assert @user_role.valid?
  end

  test "should require user" do
    @user_role.user = nil
    assert_not @user_role.valid?
    assert_includes @user_role.errors[:user], "must exist"
  end

  test "should require role" do
    @user_role.role = nil
    assert_not @user_role.valid?
    assert_includes @user_role.errors[:role], "must exist"
  end

  # === Associations ===

  test "should belong to user" do
    assert_respond_to @user_role, :user
    assert_instance_of User, @user_role.user
  end

  test "should belong to role" do
    assert_respond_to @user_role, :role
    assert_instance_of Role, @user_role.role
  end

  # === Uniqueness ===

  test "should allow same user with different roles" do
    role2 = roles(:manager)
    user_role2 = UserRole.new(user: @user, role: role2)
    assert user_role2.valid?
    assert user_role2.save
  end

  test "should allow same role for different users" do
    user2 = users(:two)
    user_role2 = UserRole.new(user: user2, role: @role)
    assert user_role2.valid?
    assert user_role2.save
  end

  test "should prevent duplicate user-role combination" do
    duplicate = UserRole.new(user: @user, role: @role)
    # Database constraint will prevent this, not model validation
    assert_raises(ActiveRecord::RecordNotUnique) do
      duplicate.save(validate: false)
    end
  end

  # === CRUD Operations ===

  test "should create user_role" do
    user = users(:two)
    role = roles(:manager)

    assert_difference "UserRole.count", 1 do
      UserRole.create!(user: user, role: role)
    end
  end

  test "should destroy user_role" do
    assert_difference "UserRole.count", -1 do
      @user_role.destroy
    end
  end

  test "should have timestamps" do
    assert_not_nil @user_role.created_at
    assert_not_nil @user_role.updated_at
  end

  # === Cascading Behavior ===

  test "should destroy user_role when user is destroyed" do
    user = User.create!(email: "cascade@example.com", password: "password", confirmed_at: Time.current)
    role = roles(:admin)
    UserRole.create!(user: user, role: role)

    assert_difference "UserRole.count", -1 do
      user.destroy
    end
  end

  test "should allow multiple roles per user" do
    role2 = roles(:manager)
    UserRole.create!(user: @user, role: role2)

    assert_equal 2, @user.user_roles.count
    assert_includes @user.roles, @role
    assert_includes @user.roles, role2
  end

  test "should allow multiple users per role" do
    user2 = users(:two)
    UserRole.create!(user: user2, role: @role)

    assert_equal 2, @role.user_roles.count
    assert_includes @role.users, @user
    assert_includes @role.users, user2
  end

  # === Edge Cases ===

  test "should not allow nil user_id" do
    user_role = UserRole.new(role: @role)
    assert_not user_role.valid?
  end

  test "should not allow nil role_id" do
    user_role = UserRole.new(user: @user)
    assert_not user_role.valid?
  end

  test "should handle user deletion gracefully" do
    user = User.create!(email: "temp@example.com", password: "password", confirmed_at: Time.current)
    user_role = UserRole.create!(user: user, role: @role)

    user.destroy
    assert_not UserRole.exists?(user_role.id)
  end
end
