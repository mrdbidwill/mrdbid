require "test_helper"

class MrCharacterMushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mr_character_mushroom = mr_character_mushrooms(:one)
  end

  test "should get index" do
    get mr_character_mushrooms_url
    assert_response :success
  end

  test "should get new" do
    get new_mr_character_mushroom_url
    assert_response :success
  end

  test "should create mr_character_mushroom" do
    assert_difference("MrCharacterMushroom.count") do
      post mr_character_mushrooms_url, params: { mr_character_mushroom: { character_value: @mr_character_mushroom.character_value, entered_by_id: @mr_character_mushroom.entered_by_id, mr_character_id_id: @mr_character_mushroom.mr_character_id_id, mushroom_id_id: @mr_character_mushroom.mushroom_id_id } }
    end

    assert_redirected_to mr_character_mushroom_url(MrCharacterMushroom.last)
  end

  test "should show mr_character_mushroom" do
    get mr_character_mushroom_url(@mr_character_mushroom)
    assert_response :success
  end

  test "should get edit" do
    get edit_mr_character_mushroom_url(@mr_character_mushroom)
    assert_response :success
  end

  test "should update mr_character_mushroom" do
    patch mr_character_mushroom_url(@mr_character_mushroom), params: { mr_character_mushroom: { character_value: @mr_character_mushroom.character_value, entered_by_id: @mr_character_mushroom.entered_by_id, mr_character_id_id: @mr_character_mushroom.mr_character_id_id, mushroom_id_id: @mr_character_mushroom.mushroom_id_id } }
    assert_redirected_to mr_character_mushroom_url(@mr_character_mushroom)
  end

  test "should destroy mr_character_mushroom" do
    assert_difference("MrCharacterMushroom.count", -1) do
      delete mr_character_mushroom_url(@mr_character_mushroom)
    end

    assert_redirected_to mr_character_mushrooms_url
  end
end
