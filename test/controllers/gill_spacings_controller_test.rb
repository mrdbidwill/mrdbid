require "test_helper"

class GillSpacingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gill_spacing = gill_spacings(:one)
  end

  test "should get index" do
    get gill_spacings_url
    assert_response :success
  end

  test "should get new" do
    get new_gill_spacing_url
    assert_response :success
  end

  test "should create gill_spacing" do
    assert_difference("GillSpacing.count") do
      post gill_spacings_url, params: { gill_spacing: { comments: @gill_spacing.comments, description: @gill_spacing.description, entered_by_id: @gill_spacing.entered_by_id, name: @gill_spacing.name, source_id: @gill_spacing.source_id } }
    end

    assert_redirected_to gill_spacing_url(GillSpacing.last)
  end

  test "should show gill_spacing" do
    get gill_spacing_url(@gill_spacing)
    assert_response :success
  end

  test "should get edit" do
    get edit_gill_spacing_url(@gill_spacing)
    assert_response :success
  end

  test "should update gill_spacing" do
    patch gill_spacing_url(@gill_spacing), params: { gill_spacing: { comments: @gill_spacing.comments, description: @gill_spacing.description, entered_by_id: @gill_spacing.entered_by_id, name: @gill_spacing.name, source_id: @gill_spacing.source_id } }
    assert_redirected_to gill_spacing_url(@gill_spacing)
  end

  test "should destroy gill_spacing" do
    assert_difference("GillSpacing.count", -1) do
      delete gill_spacing_url(@gill_spacing)
    end

    assert_redirected_to gill_spacings_url
  end
end
