require "test_helper"

class ImageMushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camera_make = camera_makes(:one)
    @camera_model = camera_models(:one)
    @image_mushroom = image_mushrooms(:one)
    @mushroom = mushrooms(:one)

    # Ensure existing fixture record has an attached image to satisfy validations
    unless @image_mushroom.image_file.attached?
      image_file = fixture_file_upload("test_image.jpg", "image/jpeg")
      @image_mushroom.image_file.attach(image_file)
    end

    @image_mushroom.update!(mushroom: @mushroom, camera_make: @camera_make, camera_model: @camera_model)
  end

  test "should get index" do
    get image_mushrooms_path
    assert_response :success
  end

  test "should get new" do
    get new_image_mushroom_path
    assert_response :success
  end

  test "should create image mushroom with valid data" do
    image_file = fixture_file_upload("test_image.jpg", "image/jpeg")

    assert_difference("ImageMushroom.count") do
      post image_mushrooms_url, params: {
        image_mushroom: {
          image_name: "Test Image",
          mushroom_id: @mushroom.id,
          part_id: parts(:one).id,
          camera_make_id: @camera_make.id,
          camera_model_id: @camera_model.id,
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


