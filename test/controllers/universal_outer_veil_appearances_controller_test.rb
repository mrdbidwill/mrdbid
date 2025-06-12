require "test_helper"

class UniversalOuterVeilAppearancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @universal_outer_veil_appearance = universal_outer_veil_appearances(:one)
  end

  test "should get index" do
    get universal_outer_veil_appearances_url
    assert_response :success
  end

  test "should get new" do
    get new_universal_outer_veil_appearance_url
    assert_response :success
  end

  test "should create universal_outer_veil_appearance" do
    assert_difference("UniversalOuterVeilAppearance.count") do
      post universal_outer_veil_appearances_url, params: { universal_outer_veil_appearance: { comments: @universal_outer_veil_appearance.comments, description: @universal_outer_veil_appearance.description, entered_by_id: @universal_outer_veil_appearance.entered_by_id, name: @universal_outer_veil_appearance.name, source_id: @universal_outer_veil_appearance.source_id } }
    end

    assert_redirected_to universal_outer_veil_appearance_url(UniversalOuterVeilAppearance.last)
  end

  test "should show universal_outer_veil_appearance" do
    get universal_outer_veil_appearance_url(@universal_outer_veil_appearance)
    assert_response :success
  end

  test "should get edit" do
    get edit_universal_outer_veil_appearance_url(@universal_outer_veil_appearance)
    assert_response :success
  end

  test "should update universal_outer_veil_appearance" do
    patch universal_outer_veil_appearance_url(@universal_outer_veil_appearance), params: { universal_outer_veil_appearance: { comments: @universal_outer_veil_appearance.comments, description: @universal_outer_veil_appearance.description, entered_by_id: @universal_outer_veil_appearance.entered_by_id, name: @universal_outer_veil_appearance.name, source_id: @universal_outer_veil_appearance.source_id } }
    assert_redirected_to universal_outer_veil_appearance_url(@universal_outer_veil_appearance)
  end

  test "should destroy universal_outer_veil_appearance" do
    assert_difference("UniversalOuterVeilAppearance.count", -1) do
      delete universal_outer_veil_appearance_url(@universal_outer_veil_appearance)
    end

    assert_redirected_to universal_outer_veil_appearances_url
  end
end
