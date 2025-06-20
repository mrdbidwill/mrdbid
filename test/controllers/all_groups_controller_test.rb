require "test_helper"

class AllGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @all_group = all_groups(:one)
  end

  test "should get index" do
    get all_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_all_group_url
    assert_response :success
  end

  test "should create all_group" do
    assert_difference("AllGroup.count") do
      post all_groups_url, params: {all_group: {comments: @all_group.comments, description: @all_group.description, entered_by_id: @all_group.entered_by_id, name: @all_group.name, source_id: @all_group.source_id}}
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
    patch all_group_url(@all_group), params: {all_group: {comments: @all_group.comments, description: @all_group.description, entered_by_id: @all_group.entered_by_id, name: @all_group.name, source_id: @all_group.source_id}}
    assert_redirected_to all_group_url(@all_group)
  end

  test "should destroy all_group" do
    assert_difference("AllGroup.count", -1) do
      delete all_group_url(@all_group)
    end
    assert_redirected_to all_groups_url
  end

  test "should not destroy all_group with members" do
    all_group = all_groups(:one)
    mushroom = mushrooms(:one)
    all_group.mushrooms << mushroom

    assert_no_difference("AllGroup.count") do
      delete all_group_url(all_group)
    end

    assert_response :unprocessable_entity
  end
end
