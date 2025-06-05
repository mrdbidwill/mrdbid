require "test_helper"

class GillThicknessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gill_thickness = gill_thicknesses(:one)
  end

  test "should get index" do
    get gill_thicknesses_url
    assert_response :success
  end

  test "should get new" do
    get new_gill_thickness_url
    assert_response :success
  end

  test "should create gill_thickness" do
    assert_difference("GillThickness.count") do
      post gill_thicknesses_url, params: { gill_thickness: { comments: @gill_thickness.comments, description: @gill_thickness.description, entered_by_id: @gill_thickness.entered_by_id, name: @gill_thickness.name, source_id: @gill_thickness.source_id } }
    end

    assert_redirected_to gill_thickness_url(GillThickness.last)
  end

  test "should show gill_thickness" do
    get gill_thickness_url(@gill_thickness)
    assert_response :success
  end

  test "should get edit" do
    get edit_gill_thickness_url(@gill_thickness)
    assert_response :success
  end

  test "should update gill_thickness" do
    patch gill_thickness_url(@gill_thickness), params: { gill_thickness: { comments: @gill_thickness.comments, description: @gill_thickness.description, entered_by_id: @gill_thickness.entered_by_id, name: @gill_thickness.name, source_id: @gill_thickness.source_id } }
    assert_redirected_to gill_thickness_url(@gill_thickness)
  end

  test "should destroy gill_thickness" do
    assert_difference("GillThickness.count", -1) do
      delete gill_thickness_url(@gill_thickness)
    end

    assert_redirected_to gill_thicknesses_url
  end
end
