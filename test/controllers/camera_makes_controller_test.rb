require "test_helper"

class CameraMakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camera_make = camera_makes(:one)
  end

  test "should get index" do
    get camera_makes_path
    assert_response :success
  end

  test "should get new" do
    get new_camera_make_path
    assert_response :success
  end

  test "should create camera make" do
    assert_difference("CameraMake.count", 1) do
      post camera_makes_path, params: {
        camera_make: {
          name: "New Camera Make", # Provide all required attributes
          another_required_field: "Value"
        }
      }
    end
    assert_redirected_to camera_make_path(CameraMake.last)
  end

  test "should show camera_make" do
    get camera_make_path(@camera_make)
    assert_response :success
  end

  test "should get edit" do
    get edit_camera_make_path(@camera_make)
    assert_response :success
  end

  test "should update camera make" do
    patch camera_make_path(@camera_make), params: {
      camera_make: {
        name: "Updated Name",
        description: @camera_make.description
      }
    }
    assert_redirected_to camera_make_path(@camera_make)
  end


  test "should destroy camera_make" do
    assert_difference("CameraMake.count", -1) do
      delete camera_make_path(@camera_make)
    end

    assert_redirected_to camera_makes_path
  end
end


