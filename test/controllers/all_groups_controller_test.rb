require "test_helper"

class AllGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @all_group = all_groups(:one)   # note the s in all_groups - matches the naming convention of fixture file all_groups.yml
  end

  test "should get index" do
    get all_group_url
    assert_response :success
  end

  test "should get new" do
    get new_all_group_url
    assert_response :success
  end

  test "should create all_group" do
    assert_difference("AllGroup.count") do
      post all_group_url, params: { all_group: { comments: @all_group.comments, description: @all_group.description, name: @all_group.name } }
    end

    assert_redirected_to all_group_url(AllGroup.last)
  end

  test "should show all_group" do
    get all_group_url(@all_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_all_group_url(@all_group)
    assert_response :success
  end

  test "should update all_group" do
    patch all_group_url(@all_group), params: { all_group: { comments: @all_group.comments, description: @all_group.description, name: @all_group.name } }
    assert_redirected_to all_group_url(@all_group)
  end

  test "should destroy all_group" do
    assert_difference("AllGroup.count", -1) do
      delete all_group_url(@all_group)
    end

    assert_redirected_to all_group_url
  end
end
