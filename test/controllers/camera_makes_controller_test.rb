require "test_helper"

class CameraMakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @camera_make = camera_makes(:one)
  end

  test "should get index" do
    get camera_makes_url
    assert_response :success
  end

  test "should get new" do
    get new_camera_make_url
    assert_response :success
  end

  test "should create camera_make" do
    assert_difference("CameraMake.count") do
      post camera_makes_url, params: { camera_make: {} }
    end

    assert_redirected_to camera_make_url(CameraMake.last)
  end

  test "should show camera_make" do
    get camera_make_url(@camera_make)
    assert_response :success
  end

  test "should get edit" do
    get edit_camera_make_url(@camera_make)
    assert_response :success
  end

  test "should update camera_make" do
    patch camera_make_url(@camera_make), params: { camera_make: {} }
    assert_redirected_to camera_make_url(@camera_make)
  end

  test "should destroy camera_make" do
    assert_difference("CameraMake.count", -1) do
      delete camera_make_url(@camera_make)
    end

    assert_redirected_to camera_makes_url
  end
end
