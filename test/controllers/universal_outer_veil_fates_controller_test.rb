require "test_helper"

class UniversalOuterVeilFatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @universal_outer_veil_fate = universal_outer_veil_fates(:one)
  end

  test "should get index" do
    get universal_outer_veil_fates_url
    assert_response :success
  end

  test "should get new" do
    get new_universal_outer_veil_fate_url
    assert_response :success
  end

  test "should create universal_outer_veil_fate" do
    assert_difference("UniversalOuterVeilFate.count") do
      post universal_outer_veil_fates_url, params: { universal_outer_veil_fate: { comments: @universal_outer_veil_fate.comments, description: @universal_outer_veil_fate.description, entered_by_id: @universal_outer_veil_fate.entered_by_id, name: @universal_outer_veil_fate.name, source_id: @universal_outer_veil_fate.source_id } }
    end

    assert_redirected_to universal_outer_veil_fate_url(UniversalOuterVeilFate.last)
  end

  test "should show universal_outer_veil_fate" do
    get universal_outer_veil_fate_url(@universal_outer_veil_fate)
    assert_response :success
  end

  test "should get edit" do
    get edit_universal_outer_veil_fate_url(@universal_outer_veil_fate)
    assert_response :success
  end

  test "should update universal_outer_veil_fate" do
    patch universal_outer_veil_fate_url(@universal_outer_veil_fate), params: { universal_outer_veil_fate: { comments: @universal_outer_veil_fate.comments, description: @universal_outer_veil_fate.description, entered_by_id: @universal_outer_veil_fate.entered_by_id, name: @universal_outer_veil_fate.name, source_id: @universal_outer_veil_fate.source_id } }
    assert_redirected_to universal_outer_veil_fate_url(@universal_outer_veil_fate)
  end

  test "should destroy universal_outer_veil_fate" do
    assert_difference("UniversalOuterVeilFate.count", -1) do
      delete universal_outer_veil_fate_url(@universal_outer_veil_fate)
    end

    assert_redirected_to universal_outer_veil_fates_url
  end
end
