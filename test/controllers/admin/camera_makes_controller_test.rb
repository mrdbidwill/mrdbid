require "test_helper"

class Admin::CameraMakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camera_make = camera_makes(:one)
    @user = users(:one)
    @user.permission_id = 1 # ensure admin? returns true
    sign_in @user
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
end


