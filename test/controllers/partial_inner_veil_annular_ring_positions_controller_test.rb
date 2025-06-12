require "test_helper"

class PartialInnerVeilAnnularRingPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partial_inner_veil_annular_ring_position = partial_inner_veil_annular_ring_positions(:one)
  end

  test "should get index" do
    get partial_inner_veil_annular_ring_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_partial_inner_veil_annular_ring_position_url
    assert_response :success
  end

  test "should create partial_inner_veil_annular_ring_position" do
    assert_difference("PartialInnerVeilAnnularRingPosition.count") do
      post partial_inner_veil_annular_ring_positions_url, params: { partial_inner_veil_annular_ring_position: { comments: @partial_inner_veil_annular_ring_position.comments, description: @partial_inner_veil_annular_ring_position.description, entered_by_id: @partial_inner_veil_annular_ring_position.entered_by_id, name: @partial_inner_veil_annular_ring_position.name, source_id: @partial_inner_veil_annular_ring_position.source_id } }
    end

    assert_redirected_to partial_inner_veil_annular_ring_position_url(PartialInnerVeilAnnularRingPosition.last)
  end

  test "should show partial_inner_veil_annular_ring_position" do
    get partial_inner_veil_annular_ring_position_url(@partial_inner_veil_annular_ring_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_partial_inner_veil_annular_ring_position_url(@partial_inner_veil_annular_ring_position)
    assert_response :success
  end

  test "should update partial_inner_veil_annular_ring_position" do
    patch partial_inner_veil_annular_ring_position_url(@partial_inner_veil_annular_ring_position), params: { partial_inner_veil_annular_ring_position: { comments: @partial_inner_veil_annular_ring_position.comments, description: @partial_inner_veil_annular_ring_position.description, entered_by_id: @partial_inner_veil_annular_ring_position.entered_by_id, name: @partial_inner_veil_annular_ring_position.name, source_id: @partial_inner_veil_annular_ring_position.source_id } }
    assert_redirected_to partial_inner_veil_annular_ring_position_url(@partial_inner_veil_annular_ring_position)
  end

  test "should destroy partial_inner_veil_annular_ring_position" do
    assert_difference("PartialInnerVeilAnnularRingPosition.count", -1) do
      delete partial_inner_veil_annular_ring_position_url(@partial_inner_veil_annular_ring_position)
    end

    assert_redirected_to partial_inner_veil_annular_ring_positions_url
  end
end
