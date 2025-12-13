require 'test_helper'

class AllGroupMushroomPolicyTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @other_user = users(:two)
    @all_group_mushroom = AllGroupMushroom.new(all_group_id: 1, mushroom_id: 1)
    @other_all_group_mushroom = AllGroupMushroom.new(all_group_id: 2, mushroom_id: 2)
  end

  test "should authorize index for any user" do
    assert Pundit.policy(@user, AllGroupMushroom).index?
    assert Pundit.policy(@other_user, AllGroupMushroom).index?
  end

  test "should authorize owner to create" do
    assert Pundit.policy(@user, @all_group_mushroom).create?
  end

  test "should not authorize non-owner to create" do
    assert_not Pundit.policy(@other_user, @all_group_mushroom).create?
  end

  test "should authorize owner to show" do
    assert Pundit.policy(@user, @all_group_mushroom).show?
  end

  test "should not authorize non-owner to show" do
    assert_not Pundit.policy(@other_user, @all_group_mushroom).show?
  end

  test "should authorize owner to update" do
    assert Pundit.policy(@user, @all_group_mushroom).update?
  end

  test "should not authorize non-owner to update" do
    assert_not Pundit.policy(@other_user, @all_group_mushroom).update?
  end

  test "should authorize owner to destroy" do
    assert Pundit.policy(@user, @all_group_mushroom).destroy?
  end

  test "should not authorize non-owner to destroy" do
    assert_not Pundit.policy(@other_user, @all_group_mushroom).destroy?
  end

  test "should authorize owner to edit" do
    assert Pundit.policy(@user, @all_group_mushroom).edit?
  end

  test "should authorize owner to create new" do
    assert Pundit.policy(@user, @all_group_mushroom).new?
  end
end
