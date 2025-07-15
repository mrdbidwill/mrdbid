require "test_helper"

class TreeAssociationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tree_associations_index_url
    assert_response :success
  end

  test "should get show" do
    get tree_associations_show_url
    assert_response :success
  end

  test "should get new" do
    get tree_associations_new_url
    assert_response :success
  end

  test "should get create" do
    get tree_associations_create_url
    assert_response :success
  end

  test "should get edit" do
    get tree_associations_edit_url
    assert_response :success
  end

  test "should get update" do
    get tree_associations_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tree_associations_destroy_url
    assert_response :success
  end
end
