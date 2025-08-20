require "test_helper"

class Admin::CameraModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camera_model = camera_models(:one)
    @user = users(:one)
    @user.permission_id = 1 # ensure admin? returns true
    sign_in @user
  end


  test "should get index" do
    get admin_camera_models_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_camera_model_url
    assert_response :success
  end

  test "should create camera model" do
    assert_difference("CameraModel.count", 1) do
      post admin_camera_models_url, params: {
        camera_model: {
          name: "New Camera Model",
          description: "Desc",
          comments: "Notes"
        }
      }
    end
    assert_redirected_to admin_camera_model_url(CameraModel.last)
  end

  test "should show camera_model" do
    get admin_camera_model_url(@camera_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_camera_model_url(@camera_model)
    assert_response :success
  end

  test "should update camera model" do
    patch admin_camera_model_url(@camera_model), params: {
      camera_model: {
        name: "Updated Name",
        description: @camera_model.description,
        comments: @camera_model.comments
      }
    }
    assert_redirected_to admin_camera_model_url(@camera_model)
  end


  test "should destroy camera_model" do
    assert_difference("CameraModel.count", -1) do
      delete admin_camera_model_url(@camera_model)
    end

    assert_redirected_to admin_camera_models_url
  end
end


