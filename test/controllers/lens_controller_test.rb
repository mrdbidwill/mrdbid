require "test_helper"

class LensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @len = lens(:one)
  end

  test "should get index" do
    get lens_url
    assert_response :success
  end

  test "should get new" do
    get new_len_url
    assert_response :success
  end

  test "should create len" do
    assert_difference("Len.count") do
      post lens_url, params: { len: { entered_by_id: @len.entered_by_id, lens_make_id: @len.lens_make_id, lens_model: @len.lens_model } }
    end

    assert_redirected_to len_url(Len.last)
  end

  test "should show len" do
    get len_url(@len)
    assert_response :success
  end

  test "should get edit" do
    get edit_len_url(@len)
    assert_response :success
  end

  test "should update len" do
    patch len_url(@len), params: { len: { entered_by_id: @len.entered_by_id, lens_make_id: @len.lens_make_id, lens_model: @len.lens_model } }
    assert_redirected_to len_url(@len)
  end

  test "should destroy len" do
    assert_difference("Len.count", -1) do
      delete len_url(@len)
    end

    assert_redirected_to lens_url
  end
end
