require "test_helper"

class Admin::CamerasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camera = cameras(:one)
    @admin = users(:one)     # admin via fixtures
    @non_admin = users(:two) # member via fixtures

    @admin.reload
    assert @admin.admin?, "Fixture user :one must be admin (check users.yml permissions_id)"
    sign_in @admin
  end

  test "should get index" do
    get admin_cameras_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_camera_url
    assert_response :success
  end

  test "should create camera make" do
    assert_difference("Camera.count", 1) do
      post admin_cameras_url, params: {
        camera: {
          name: "New Camera Make",
          description: "Desc",
          comments: "Notes"
        }
      }
    end
    assert_redirected_to admin_camera_url(Camera.last)
  end

  test "should show camera" do
    get admin_camera_url(@camera)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_camera_url(@camera)
    assert_response :success
  end

  test "should update camera make" do
    patch admin_camera_url(@camera), params: {
      camera: {
        name: "Updated Name",
        description: @camera.description,
        comments: @camera.comments
      }
    }
    assert_redirected_to admin_camera_url(@camera)
  end

  test "should destroy camera" do
    assert_difference("Camera.count", -1) do
      delete admin_camera_url(@camera)
    end

    assert_redirected_to admin_cameras_url
  end

  test "non-admin cannot access index" do
    sign_in @non_admin
    get admin_cameras_url
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot view show" do
    sign_in @non_admin
    get admin_camera_url(@camera)
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot get new" do
    sign_in @non_admin
    get new_admin_camera_url
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot create" do
    sign_in @non_admin
    assert_no_difference("Camera.count") do
      post admin_cameras_url, params: { camera: { name: "NA", description: "x", comments: "y", source: "z" } }
    end
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot edit" do
    sign_in @non_admin
    get edit_admin_camera_url(@camera)
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot update" do
    sign_in @non_admin
    patch admin_camera_url(@camera), params: { camera: { name: "Updated" } }
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot destroy" do
    sign_in @non_admin
    assert_no_difference("Camera.count") do
      delete admin_camera_url(@camera)
    end
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end
end


