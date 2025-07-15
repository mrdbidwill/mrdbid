require "test_helper"

class LensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lens_index_url
    assert_response :success
  end

  test "should get show" do
    get lens_show_url
    assert_response :success
  end

  test "should get new" do
    get lens_new_url
    assert_response :success
  end

  test "should get create" do
    get lens_create_url
    assert_response :success
  end

  test "should get edit" do
    get lens_edit_url
    assert_response :success
  end

  test "should get update" do
    get lens_update_url
    assert_response :success
  end

  test "should get destroy" do
    get lens_destroy_url
    assert_response :success
  end
end
