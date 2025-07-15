require "test_helper"

class ImageMushroomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get image_mushrooms_index_url
    assert_response :success
  end

  test "should get show" do
    get image_mushrooms_show_url
    assert_response :success
  end

  test "should get new" do
    get image_mushrooms_new_url
    assert_response :success
  end

  test "should get create" do
    get image_mushrooms_create_url
    assert_response :success
  end

  test "should get edit" do
    get image_mushrooms_edit_url
    assert_response :success
  end

  test "should get update" do
    get image_mushrooms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get image_mushrooms_destroy_url
    assert_response :success
  end
end
