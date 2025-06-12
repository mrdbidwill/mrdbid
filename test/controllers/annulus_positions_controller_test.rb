require "test_helper"

class AnnulusPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annulus_position = annulus_positions(:one)
  end

  test "should get index" do
    get annulus_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_annulus_position_url
    assert_response :success
  end

  test "should create annulus_position" do
    assert_difference("AnnulusPosition.count") do
      post annulus_positions_url, params: { annulus_position: { comments: @annulus_position.comments, description: @annulus_position.description, entered_by_id: @annulus_position.entered_by_id, name: @annulus_position.name, source_id: @annulus_position.source_id } }
    end

    assert_redirected_to annulus_position_url(AnnulusPosition.last)
  end

  test "should show annulus_position" do
    get annulus_position_url(@annulus_position)
    assert_response :success
  end

  test "should get edit" do
    get edit_annulus_position_url(@annulus_position)
    assert_response :success
  end

  test "should update annulus_position" do
    patch annulus_position_url(@annulus_position), params: { annulus_position: { comments: @annulus_position.comments, description: @annulus_position.description, entered_by_id: @annulus_position.entered_by_id, name: @annulus_position.name, source_id: @annulus_position.source_id } }
    assert_redirected_to annulus_position_url(@annulus_position)
  end

  test "should destroy annulus_position" do
    assert_difference("AnnulusPosition.count", -1) do
      delete annulus_position_url(@annulus_position)
    end

    assert_redirected_to annulus_positions_url
  end
end
