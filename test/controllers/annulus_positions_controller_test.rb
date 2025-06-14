require "test_helper"

class AnnulusPositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annulus_position = annulus_positions(:one)
    @source = sources(:one)
    @user = users(:one)
  end

  test "should get index" do
    get annulus_positions_url
    assert_response :success
  end

  test "should get new" do
    get new_annulus_position_url
    assert_response :success
  end

  test "should create valid annulus_position" do
    assert_difference("AnnulusPosition.count") do
      post annulus_positions_url, params: { annulus_position: { 
        name: "New Position", 
        description: "Valid description", 
        comments: "Valid comments", 
        source_id: @source.id, 
        entered_by_id: @user.id 
      }}
    end

    assert_redirected_to annulus_position_url(AnnulusPosition.last)
  end

  test "should not create invalid annulus_position" do
    assert_no_difference("AnnulusPosition.count") do
      post annulus_positions_url, params: { annulus_position: { 
        name: nil, 
        source_id: nil 
      }}
    end

    assert_response :unprocessable_entity
  end

  test "should update annulus_position" do
    patch annulus_position_url(@annulus_position), params: { annulus_position: { 
      name: "Updated name" 
    }}
    assert_redirected_to annulus_position_url(@annulus_position)
    assert_equal "Updated name", @annulus_position.reload.name
  end

  test "should destroy annulus_position" do
    assert_difference("AnnulusPosition.count", -1) do
      delete annulus_position_url(@annulus_position)
    end
    assert_redirected_to annulus_positions_url
  end
end