require "test_helper"

class MrCharacterControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one) # Reference your user fixture
    @mr_character = mr_characters(:one) # Reference your mr_character fixture
    sign_in @user # Devise helper to sign in the user
  end


  test "should get index" do
    get mr_characters_url
    assert_response :success
  end

  test "should get new" do
    get new_mr_character_url
    assert_response :success
  end

  test "should create mr_character" do
    assert_difference("MrCharacter.count") do
      post mr_characters_url, params: { mr_character: { comments: @mr_character.comments, description: @mr_character.description, name: @mr_character.name } }
    end

    assert_redirected_to mr_character_url(MrCharacter.last)
  end

  test "should show mr_character" do
    get mr_character_url(@mr_character)
    assert_response :success
  end

  test "should get edit" do
    get edit_mr_character_url(@mr_character)
    assert_response :success
  end

  test "should update mr_character" do
    patch mr_character_url(@mr_character), params: { mr_character: { comments: @mr_character.comments, description: @mr_character.description, name: @mr_character.name } }
    assert_redirected_to mr_character_url(@mr_character)
  end

  test "should destroy mr_character" do
    assert_difference("MrCharacter.count", -1) do
      delete mr_character_url(@mr_character)
    end

    assert_redirected_to mr_character_url
  end
end
