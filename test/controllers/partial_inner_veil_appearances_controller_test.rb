require "test_helper"

class PartialInnerVeilAppearancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partial_inner_veil_appearance = partial_inner_veil_appearances(:one)
  end

  test "should get index" do
    get partial_inner_veil_appearances_url
    assert_response :success
  end

  test "should get new" do
    get new_partial_inner_veil_appearance_url
    assert_response :success
  end

  test "should create partial_inner_veil_appearance" do
    assert_difference("PartialInnerVeilAppearance.count") do
      post partial_inner_veil_appearances_url, params: { partial_inner_veil_appearance: { comments: @partial_inner_veil_appearance.comments, description: @partial_inner_veil_appearance.description, entered_by_id: @partial_inner_veil_appearance.entered_by_id, name: @partial_inner_veil_appearance.name, source_id: @partial_inner_veil_appearance.source_id } }
    end

    assert_redirected_to partial_inner_veil_appearance_url(PartialInnerVeilAppearance.last)
  end

  test "should show partial_inner_veil_appearance" do
    get partial_inner_veil_appearance_url(@partial_inner_veil_appearance)
    assert_response :success
  end

  test "should get edit" do
    get edit_partial_inner_veil_appearance_url(@partial_inner_veil_appearance)
    assert_response :success
  end

  test "should update partial_inner_veil_appearance" do
    patch partial_inner_veil_appearance_url(@partial_inner_veil_appearance), params: { partial_inner_veil_appearance: { comments: @partial_inner_veil_appearance.comments, description: @partial_inner_veil_appearance.description, entered_by_id: @partial_inner_veil_appearance.entered_by_id, name: @partial_inner_veil_appearance.name, source_id: @partial_inner_veil_appearance.source_id } }
    assert_redirected_to partial_inner_veil_appearance_url(@partial_inner_veil_appearance)
  end

  test "should destroy partial_inner_veil_appearance" do
    assert_difference("PartialInnerVeilAppearance.count", -1) do
      delete partial_inner_veil_appearance_url(@partial_inner_veil_appearance)
    end

    assert_redirected_to partial_inner_veil_appearances_url
  end
end
