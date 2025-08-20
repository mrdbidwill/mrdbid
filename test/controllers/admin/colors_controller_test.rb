require "test_helper"

class ColorsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @color = colors(:one) # Reference your color fixture
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
    assert_difference("Color.count", 1) do
      post colors_url, params: {
        color: {
          latin_name: "Unique Latin Name #{SecureRandom.hex(4)}",
          common_name: "Some Common Name",
          color_group: 1,
          hex: "#112233",
          sequence: 42,
          r_val: 17,
          g_val: 34,
          b_val: 51,
          cwc_r: 16,
          cwc_g: 32,
          cwc_b: 48,
          closest_websafe_color: "#102030",
          image_file_address: "image_file_address.jpg",
          metadata: { source: "test" }
        }
      }
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
    patch color_url(@color), params: { color: { latin_name: @color.latin_name, common_name: @color.common_name, color_group: @color.color_group } }
    assert_redirected_to color_url(@color)
  end

  test "should destroy color" do
    assert_difference("Color.count", -1) do
      delete color_url(@color)
    end

    assert_redirected_to colors_url
  end
end
