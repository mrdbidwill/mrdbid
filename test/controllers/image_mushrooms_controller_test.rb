require "test_helper"

class ImageMushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image_mushroom = image_mushrooms(:one)
  end

  test "should get index" do
    get image_mushrooms_path
    assert_response :success
  end

  test "should get new" do
    get new_image_mushroom_path
    assert_response :success
  end

  test "should create image mushroom" do
    # Create a test image file
    image_file = fixture_file_upload(Rails.root.join('test', 'fixtures', 'files', 'test_image.jpg'), 'image/jpeg')

    assert_difference("ImageMushroom.count") do
      post image_mushrooms_url, params: {
        image_mushroom: {
          image_name: "Test Image",
          mushroom_id: mushrooms(:one).id,
          part_id: parts(:one).id, # Assuming you have lookup_items fixtures for parts
          image_file: image_file,
          lens: "50mm",
          exposure: "1/60",
          aperture: "f/2.8",
          iso: "100"
        }
      }
    end
    assert_redirected_to image_mushroom_path(ImageMushroom.last)
  end


  test "should show image_mushroom" do
    get image_mushroom_path(@image_mushroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_image_mushroom_path(@image_mushroom)
    assert_response :success
  end

  test "should update image mushroom" do
    patch image_mushroom_path(@image_mushroom), params: {
      image_mushroom: {
        name: "Ugliese Picture",
        mushroom_id: "909"
      }
    }
    assert_redirected_to image_mushroom_path(@image_mushroom)
  end


  test "should destroy image_mushroom" do
    assert_difference("ImageMushroom.count", -1) do
      delete image_mushroom_path(@image_mushroom)
    end

    assert_redirected_to image_mushrooms_path
  end
end


