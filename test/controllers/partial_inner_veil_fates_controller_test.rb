require "test_helper"

class PartialInnerVeilFatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partial_inner_veil_fate = partial_inner_veil_fates(:one)
  end

  test "should get index" do
    get partial_inner_veil_fates_url
    assert_response :success
  end

  test "should get new" do
    get new_partial_inner_veil_fate_url
    assert_response :success
  end

  test "should create partial_inner_veil_fate" do
    assert_difference("PartialInnerVeilFate.count") do
      post partial_inner_veil_fates_url, params: { partial_inner_veil_fate: { comments: @partial_inner_veil_fate.comments, description: @partial_inner_veil_fate.description, entered_by_id: @partial_inner_veil_fate.entered_by_id, name: @partial_inner_veil_fate.name, source_id: @partial_inner_veil_fate.source_id } }
    end

    assert_redirected_to partial_inner_veil_fate_url(PartialInnerVeilFate.last)
  end

  test "should show partial_inner_veil_fate" do
    get partial_inner_veil_fate_url(@partial_inner_veil_fate)
    assert_response :success
  end

  test "should get edit" do
    get edit_partial_inner_veil_fate_url(@partial_inner_veil_fate)
    assert_response :success
  end

  test "should update partial_inner_veil_fate" do
    patch partial_inner_veil_fate_url(@partial_inner_veil_fate), params: { partial_inner_veil_fate: { comments: @partial_inner_veil_fate.comments, description: @partial_inner_veil_fate.description, entered_by_id: @partial_inner_veil_fate.entered_by_id, name: @partial_inner_veil_fate.name, source_id: @partial_inner_veil_fate.source_id } }
    assert_redirected_to partial_inner_veil_fate_url(@partial_inner_veil_fate)
  end

  test "should destroy partial_inner_veil_fate" do
    assert_difference("PartialInnerVeilFate.count", -1) do
      delete partial_inner_veil_fate_url(@partial_inner_veil_fate)
    end

    assert_redirected_to partial_inner_veil_fates_url
  end
end
