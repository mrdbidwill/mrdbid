require "test_helper"

class AllGroupMushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @all_group_mushroom = all_group_mushrooms(:one)
  end

  test "should get index" do
    get all_group_mushrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_all_group_mushroom_url
    assert_response :success
  end

  test "should create all_group_mushroom" do
    assert_difference("AllGroupMushroom.count") do
      post all_group_mushrooms_url, params: { all_group_mushroom: { all_group_id_id: @all_group_mushroom.all_group_id_id, mushroom_id_id: @all_group_mushroom.mushroom_id_id } }
    end

    assert_redirected_to all_group_mushroom_url(AllGroupMushroom.last)
  end

  test "should show all_group_mushroom" do
    get all_group_mushroom_url(@all_group_mushroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_all_group_mushroom_url(@all_group_mushroom)
    assert_response :success
  end

  test "should update all_group_mushroom" do
    patch all_group_mushroom_url(@all_group_mushroom), params: { all_group_mushroom: { all_group_id_id: @all_group_mushroom.all_group_id_id, mushroom_id_id: @all_group_mushroom.mushroom_id_id } }
    assert_redirected_to all_group_mushroom_url(@all_group_mushroom)
  end

  test "should destroy all_group_mushroom" do
    assert_difference("AllGroupMushroom.count", -1) do
      delete all_group_mushroom_url(@all_group_mushroom)
    end

    assert_redirected_to all_group_mushrooms_url
  end
end
