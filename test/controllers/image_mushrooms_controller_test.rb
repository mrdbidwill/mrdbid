require "test_helper"

class ImageMushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_mushroom = image_mushrooms(:one)
  end

  test "should get index" do
    get image_mushrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_image_mushroom_url
    assert_response :success
  end

  test "should create image_mushroom" do
    assert_difference("ImageMushroom.count") do
      post image_mushrooms_url, params: { image_mushroom: { GPSAltitude: @image_mushroom.GPSAltitude, GPSAltitudeRef: @image_mushroom.GPSAltitudeRef, GPSLatitudeRef: @image_mushroom.GPSLatitudeRef, GPSLatitude_0: @image_mushroom.GPSLatitude_0, GPSLatitude_1: @image_mushroom.GPSLatitude_1, GPSLatitude_2: @image_mushroom.GPSLatitude_2, GPSLongitudeRef: @image_mushroom.GPSLongitudeRef, GPSLongitude_0: @image_mushroom.GPSLongitude_0, GPSLongitude_1: @image_mushroom.GPSLongitude_1, GPSLongitude_2: @image_mushroom.GPSLongitude_2, aperture: @image_mushroom.aperture, camera_make_id: @image_mushroom.camera_make_id, camera_model: @image_mushroom.camera_model, date_taken: @image_mushroom.date_taken, description: @image_mushroom.description, entered_by_id: @image_mushroom.entered_by_id, exposure: @image_mushroom.exposure, file_address: @image_mushroom.file_address, focal_length: @image_mushroom.focal_length, image_height: @image_mushroom.image_height, image_name: @image_mushroom.image_name, image_width: @image_mushroom.image_width, iso: @image_mushroom.iso, lens: @image_mushroom.lens, mushroom_id_id: @image_mushroom.mushroom_id_id, parts_id: @image_mushroom.parts_id } }
    end

    assert_redirected_to image_mushroom_url(ImageMushroom.last)
  end

  test "should show image_mushroom" do
    get image_mushroom_url(@image_mushroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_mushroom_url(@image_mushroom)
    assert_response :success
  end

  test "should update image_mushroom" do
    patch image_mushroom_url(@image_mushroom), params: { image_mushroom: { GPSAltitude: @image_mushroom.GPSAltitude, GPSAltitudeRef: @image_mushroom.GPSAltitudeRef, GPSLatitudeRef: @image_mushroom.GPSLatitudeRef, GPSLatitude_0: @image_mushroom.GPSLatitude_0, GPSLatitude_1: @image_mushroom.GPSLatitude_1, GPSLatitude_2: @image_mushroom.GPSLatitude_2, GPSLongitudeRef: @image_mushroom.GPSLongitudeRef, GPSLongitude_0: @image_mushroom.GPSLongitude_0, GPSLongitude_1: @image_mushroom.GPSLongitude_1, GPSLongitude_2: @image_mushroom.GPSLongitude_2, aperture: @image_mushroom.aperture, camera_make_id: @image_mushroom.camera_make_id, camera_model: @image_mushroom.camera_model, date_taken: @image_mushroom.date_taken, description: @image_mushroom.description, entered_by_id: @image_mushroom.entered_by_id, exposure: @image_mushroom.exposure, file_address: @image_mushroom.file_address, focal_length: @image_mushroom.focal_length, image_height: @image_mushroom.image_height, image_name: @image_mushroom.image_name, image_width: @image_mushroom.image_width, iso: @image_mushroom.iso, lens: @image_mushroom.lens, mushroom_id_id: @image_mushroom.mushroom_id_id, parts_id: @image_mushroom.parts_id } }
    assert_redirected_to image_mushroom_url(@image_mushroom)
  end

  test "should destroy image_mushroom" do
    assert_difference("ImageMushroom.count", -1) do
      delete image_mushroom_url(@image_mushroom)
    end

    assert_redirected_to image_mushrooms_url
  end
end
