require "test_helper"

class AllGroupMushroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get all_group_mushrooms_index_url
    assert_response :success
  end

  test "should get show" do
    get all_group_mushrooms_show_url
    assert_response :success
  end

  test "should get new" do
    get all_group_mushrooms_new_url
    assert_response :success
  end

  test "should get create" do
    get all_group_mushrooms_create_url
    assert_response :success
  end

  test "should get edit" do
    get all_group_mushrooms_edit_url
    assert_response :success
  end

  test "should get update" do
    get all_group_mushrooms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get all_group_mushrooms_destroy_url
    assert_response :success
  end
end
