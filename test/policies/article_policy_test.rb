require 'test_helper'

class ArticlePolicyTest < ActiveSupport::TestCase
  setup do
    @admin_user = users(:one)
    @regular_user = users(:two)
    @article = Article.new(title: "Test Article")
  end

  test "should authorize admin to view index" do
    assert Pundit.policy(@admin_user, Article).index?
  end

  test "should not authorize regular user to view index" do
    assert_not Pundit.policy(@regular_user, Article).index?
  end

  test "should not authorize nil user to view index" do
    assert_not Pundit.policy(nil, Article).index?
  end

  test "should authorize admin to show article" do
    assert Pundit.policy(@admin_user, @article).show?
  end

  test "should not authorize regular user to show article" do
    assert_not Pundit.policy(@regular_user, @article).show?
  end

  test "should not authorize nil user to show article" do
    assert_not Pundit.policy(nil, @article).show?
  end

  test "should authorize admin to create article" do
    assert Pundit.policy(@admin_user, Article.new).create?
  end

  test "should not authorize regular user to create article" do
    assert_not Pundit.policy(@regular_user, Article.new).create?
  end

  test "should authorize admin to new article" do
    assert Pundit.policy(@admin_user, Article.new).new?
  end

  test "should not authorize regular user to new article" do
    assert_not Pundit.policy(@regular_user, Article.new).new?
  end

  test "should authorize admin to update article" do
    assert Pundit.policy(@admin_user, @article).update?
  end

  test "should not authorize regular user to update article" do
    assert_not Pundit.policy(@regular_user, @article).update?
  end

  test "should authorize admin to edit article" do
    assert Pundit.policy(@admin_user, @article).edit?
  end

  test "should not authorize regular user to edit article" do
    assert_not Pundit.policy(@regular_user, @article).edit?
  end

  test "should authorize admin to destroy article" do
    assert Pundit.policy(@admin_user, @article).destroy?
  end

  test "should not authorize regular user to destroy article" do
    assert_not Pundit.policy(@regular_user, @article).destroy?
  end
end
