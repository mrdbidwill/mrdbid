require "test_helper"

class ClusterMushroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cluster_mushrooms_index_url
    assert_response :success
  end

  test "should get show" do
    get cluster_mushrooms_show_url
    assert_response :success
  end

  test "should get new" do
    get cluster_mushrooms_new_url
    assert_response :success
  end

  test "should get create" do
    get cluster_mushrooms_create_url
    assert_response :success
  end

  test "should get edit" do
    get cluster_mushrooms_edit_url
    assert_response :success
  end

  test "should get update" do
    get cluster_mushrooms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cluster_mushrooms_destroy_url
    assert_response :success
  end
end
