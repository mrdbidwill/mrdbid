require "test_helper"

class Admin::CameraModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camera_model = camera_models(:one)
    @admin = users(:one)     # admin via fixtures
    @non_admin = users(:two) # member via fixtures

    @admin.reload
    assert @admin.admin?, "Fixture user :one must be admin (check users.yml permissions_id)"
    sign_in @admin
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

  test "non-admin cannot access index" do
    sign_in @non_admin
    get admin_camera_models_url
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot view show" do
    sign_in @non_admin
    get admin_camera_model_url(@camera_model)
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot get new" do
    sign_in @non_admin
    get new_admin_camera_model_url
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot create" do
    sign_in @non_admin
    assert_no_difference("CameraModel.count") do
      post admin_camera_models_url, params: { camera_model: { name: "NA", description: "x", comments: "y", source: "z" } }
    end
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot edit" do
    sign_in @non_admin
    get edit_admin_camera_model_url(@camera_model)
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot update" do
    sign_in @non_admin
    patch admin_camera_model_url(@camera_model), params: { camera_model: { name: "Updated" } }
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot destroy" do
    sign_in @non_admin
    assert_no_difference("CameraModel.count") do
      delete admin_camera_model_url(@camera_model)
    end
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end
end


