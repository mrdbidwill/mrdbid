require "test_helper"

class ImageMushroomThumbnailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_mushroom_thumbnail = image_mushroom_thumbnails(:one)
  end

  test "should get index" do
    get image_mushroom_thumbnails_url
    assert_response :success
  end

  test "should get new" do
    get new_image_mushroom_thumbnail_url
    assert_response :success
  end

  test "should create image_mushroom_thumbnail" do
    assert_difference("ImageMushroomThumbnail.count") do
      post image_mushroom_thumbnails_url, params: { image_mushroom_thumbnail: { entered_by_id: @image_mushroom_thumbnail.entered_by_id, image_height: @image_mushroom_thumbnail.image_height, image_mushroom_id_id: @image_mushroom_thumbnail.image_mushroom_id_id, image_width: @image_mushroom_thumbnail.image_width, thumbnail_file_address: @image_mushroom_thumbnail.thumbnail_file_address } }
    end

    assert_redirected_to image_mushroom_thumbnail_url(ImageMushroomThumbnail.last)
  end

  test "should show image_mushroom_thumbnail" do
    get image_mushroom_thumbnail_url(@image_mushroom_thumbnail)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_mushroom_thumbnail_url(@image_mushroom_thumbnail)
    assert_response :success
  end

  test "should update image_mushroom_thumbnail" do
    patch image_mushroom_thumbnail_url(@image_mushroom_thumbnail), params: { image_mushroom_thumbnail: { entered_by_id: @image_mushroom_thumbnail.entered_by_id, image_height: @image_mushroom_thumbnail.image_height, image_mushroom_id_id: @image_mushroom_thumbnail.image_mushroom_id_id, image_width: @image_mushroom_thumbnail.image_width, thumbnail_file_address: @image_mushroom_thumbnail.thumbnail_file_address } }
    assert_redirected_to image_mushroom_thumbnail_url(@image_mushroom_thumbnail)
  end

  test "should destroy image_mushroom_thumbnail" do
    assert_difference("ImageMushroomThumbnail.count", -1) do
      delete image_mushroom_thumbnail_url(@image_mushroom_thumbnail)
    end

    assert_redirected_to image_mushroom_thumbnails_url
  end
end
