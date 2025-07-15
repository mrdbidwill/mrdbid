require "test_helper"

class ImageMushroomThumbnailsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get image_mushroom_thumbnails_index_url
    assert_response :success
  end

  test "should get show" do
    get image_mushroom_thumbnails_show_url
    assert_response :success
  end

  test "should get new" do
    get image_mushroom_thumbnails_new_url
    assert_response :success
  end

  test "should get create" do
    get image_mushroom_thumbnails_create_url
    assert_response :success
  end

  test "should get edit" do
    get image_mushroom_thumbnails_edit_url
    assert_response :success
  end

  test "should get update" do
    get image_mushroom_thumbnails_update_url
    assert_response :success
  end

  test "should get destroy" do
    get image_mushroom_thumbnails_destroy_url
    assert_response :success
  end
end
