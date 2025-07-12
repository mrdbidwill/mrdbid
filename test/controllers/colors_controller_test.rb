require "test_helper"

class ColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color = colors(:one)
  end

  test "should get index" do
    get colors_url
    assert_response :success
  end

  test "should get new" do
    get new_color_url
    assert_response :success
  end

  test "should create color" do
    assert_difference("Color.count") do
      post colors_url, params: { color: { b_val: @color.b_val, closest_websafe_color: @color.closest_websafe_color, color_group: @color.color_group, common_name: @color.common_name, g_val: @color.g_val, hex: @color.hex, latin_name: @color.latin_name, metadata: @color.metadata, r_val: @color.r_val } }
    end

    assert_redirected_to color_url(Color.last)
  end

  test "should show color" do
    get color_url(@color)
    assert_response :success
  end

  test "should get edit" do
    get edit_color_url(@color)
    assert_response :success
  end

  test "should update color" do
    patch color_url(@color), params: { color: { b_val: @color.b_val, closest_websafe_color: @color.closest_websafe_color, color_group: @color.color_group, common_name: @color.common_name, g_val: @color.g_val, hex: @color.hex, latin_name: @color.latin_name, metadata: @color.metadata, r_val: @color.r_val } }
    assert_redirected_to color_url(@color)
  end

  test "should destroy color" do
    assert_difference("Color.count", -1) do
      delete color_url(@color)
    end

    assert_redirected_to colors_url
  end
end
