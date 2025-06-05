require "test_helper"

class CapSurfaceDrynessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cap_surface_dryness = cap_surface_drynesses(:one)
  end

  test "should get index" do
    get cap_surface_drynesses_url
    assert_response :success
  end

  test "should get new" do
    get new_cap_surface_dryness_url
    assert_response :success
  end

  test "should create cap_surface_dryness" do
    assert_difference("CapSurfaceDryness.count") do
      post cap_surface_drynesses_url, params: { cap_surface_dryness: { comments: @cap_surface_dryness.comments, description: @cap_surface_dryness.description, entered_by_id: @cap_surface_dryness.entered_by_id, name: @cap_surface_dryness.name, source_id: @cap_surface_dryness.source_id } }
    end

    assert_redirected_to cap_surface_dryness_url(CapSurfaceDryness.last)
  end

  test "should show cap_surface_dryness" do
    get cap_surface_dryness_url(@cap_surface_dryness)
    assert_response :success
  end

  test "should get edit" do
    get edit_cap_surface_dryness_url(@cap_surface_dryness)
    assert_response :success
  end

  test "should update cap_surface_dryness" do
    patch cap_surface_dryness_url(@cap_surface_dryness), params: { cap_surface_dryness: { comments: @cap_surface_dryness.comments, description: @cap_surface_dryness.description, entered_by_id: @cap_surface_dryness.entered_by_id, name: @cap_surface_dryness.name, source_id: @cap_surface_dryness.source_id } }
    assert_redirected_to cap_surface_dryness_url(@cap_surface_dryness)
  end

  test "should destroy cap_surface_dryness" do
    assert_difference("CapSurfaceDryness.count", -1) do
      delete cap_surface_dryness_url(@cap_surface_dryness)
    end

    assert_redirected_to cap_surface_drynesses_url
  end
end
