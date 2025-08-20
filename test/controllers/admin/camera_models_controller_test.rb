require "test_helper"

class CameraModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camera_model = camera_models(:one)
  end

  test "should get index" do
    get camera_models_path
    assert_response :success
  end

  test "should get new" do
    get new_camera_model_path
    assert_response :success
  end

  test "should create camera model" do
    assert_difference("CameraModel.count", 1) do
      post camera_models_path, params: {
        camera_model: {
          name: "New Camera Model", # Provide all required attributes
          description: "A healthy camera model"
        }
      }
    end
    assert_redirected_to camera_model_path(CameraModel.last)
  end

  test "should show camera_model" do
    get camera_model_path(@camera_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_camera_model_path(@camera_model)
    assert_response :success
  end

  test "should update camera model" do
    patch camera_model_path(@camera_model), params: {
      camera_model: {
        name: "Updated Name",
        description: @camera_model.description
      }
    }
    assert_redirected_to camera_model_path(@camera_model)
  end


  test "should destroy camera_model" do
    assert_difference("CameraModel.count", -1) do
      delete camera_model_path(@camera_model)
    end

    assert_redirected_to camera_models_path
  end
  end

