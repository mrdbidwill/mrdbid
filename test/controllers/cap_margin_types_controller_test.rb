require "test_helper"

class CapMarginTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cap_margin_type = cap_margin_types(:one)
  end

  test "should get index" do
    get cap_margin_types_url
    assert_response :success
  end

  test "should get new" do
    get new_cap_margin_type_url
    assert_response :success
  end

  test "should create cap_margin_type" do
    assert_difference("CapMarginType.count") do
      post cap_margin_types_url, params: { cap_margin_type: { comments: @cap_margin_type.comments, description: @cap_margin_type.description, entered_by_id: @cap_margin_type.entered_by_id, name: @cap_margin_type.name, source_id: @cap_margin_type.source_id } }
    end

    assert_redirected_to cap_margin_type_url(CapMarginType.last)
  end

  test "should show cap_margin_type" do
    get cap_margin_type_url(@cap_margin_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_cap_margin_type_url(@cap_margin_type)
    assert_response :success
  end

  test "should update cap_margin_type" do
    patch cap_margin_type_url(@cap_margin_type), params: { cap_margin_type: { comments: @cap_margin_type.comments, description: @cap_margin_type.description, entered_by_id: @cap_margin_type.entered_by_id, name: @cap_margin_type.name, source_id: @cap_margin_type.source_id } }
    assert_redirected_to cap_margin_type_url(@cap_margin_type)
  end

  test "should destroy cap_margin_type" do
    assert_difference("CapMarginType.count", -1) do
      delete cap_margin_type_url(@cap_margin_type)
    end

    assert_redirected_to cap_margin_types_url
  end
end
