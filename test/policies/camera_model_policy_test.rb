# test/policies/camera_model_policy_test.rb
require "test_helper"

class CameraModelPolicyTest < ActiveSupport::TestCase
  setup do
    @admin = users(:one)
    @member = users(:two)
    @record = camera_models(:one)
  end

  test "admin is permitted for all actions" do
    policy = Pundit.policy(@admin, @record)
    assert policy.index?
    assert policy.show?
    assert policy.new?
    assert policy.create?
    assert policy.edit?
    assert policy.update?
    assert policy.destroy?

    scope = Pundit.policy_scope(@admin, CameraModel)
    assert_equal CameraModel.count, scope.count
  end

  test "member is denied for all actions and scope is empty" do
    policy = Pundit.policy(@member, @record)
    refute policy.index?
    refute policy.show?
    refute policy.new?
    refute policy.create?
    refute policy.edit?
    refute policy.update?
    refute policy.destroy?

    scope = Pundit.policy_scope(@member, CameraModel)
    assert_equal 0, scope.count
  end

  test "guest is denied for all actions and scope is empty" do
    policy = Pundit.policy(nil, @record)
    refute policy.index?
    refute policy.show?
    refute policy.new?
    refute policy.create?
    refute policy.edit?
    refute policy.update?
    refute policy.destroy?

    scope = Pundit.policy_scope(nil, CameraModel)
    assert_equal 0, scope.count
  end
end