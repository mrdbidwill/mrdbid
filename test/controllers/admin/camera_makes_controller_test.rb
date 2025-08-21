require "test_helper"

class Admin::CameraMakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camera_make = camera_makes(:one)
    @admin = users(:one)     # admin via fixtures
    @non_admin = users(:two) # member via fixtures

    @admin.reload
    assert @admin.admin?, "Fixture user :one must be admin (check users.yml permissions_id)"
    sign_in @admin
  end

  test "should get index" do
    get admin_camera_makes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_camera_make_url
    assert_response :success
  end

  test "should create camera make" do
    assert_difference("CameraMake.count", 1) do
      post admin_camera_makes_url, params: {
        camera_make: {
          name: "New Camera Make",
          description: "Desc",
          comments: "Notes"
        }
      }
    end
    assert_redirected_to admin_camera_make_url(CameraMake.last)
  end

  test "should show camera_make" do
    get admin_camera_make_url(@camera_make)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_camera_make_url(@camera_make)
    assert_response :success
  end

  test "should update camera make" do
    patch admin_camera_make_url(@camera_make), params: {
      camera_make: {
        name: "Updated Name",
        description: @camera_make.description,
        comments: @camera_make.comments
      }
    }
    assert_redirected_to admin_camera_make_url(@camera_make)
  end

  test "should destroy camera_make" do
    assert_difference("CameraMake.count", -1) do
      delete admin_camera_make_url(@camera_make)
    end

    assert_redirected_to admin_camera_makes_url
  end

  test "non-admin cannot access index" do
    sign_in @non_admin
    get admin_camera_makes_url
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot view show" do
    sign_in @non_admin
    get admin_camera_make_url(@camera_make)
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot get new" do
    sign_in @non_admin
    get new_admin_camera_make_url
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot create" do
    sign_in @non_admin
    assert_no_difference("CameraMake.count") do
      post admin_camera_makes_url, params: { camera_make: { name: "NA", description: "x", comments: "y", source: "z" } }
    end
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot edit" do
    sign_in @non_admin
    get edit_admin_camera_make_url(@camera_make)
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot update" do
    sign_in @non_admin
    patch admin_camera_make_url(@camera_make), params: { camera_make: { name: "Updated" } }
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end

  test "non-admin cannot destroy" do
    sign_in @non_admin
    assert_no_difference("CameraMake.count") do
      delete admin_camera_make_url(@camera_make)
    end
    assert_redirected_to root_path
    assert_match "not authorized", flash[:alert].to_s.downcase
  end
end


