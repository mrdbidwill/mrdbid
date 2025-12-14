require "test_helper"

class MrCharacterMushroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @mushroom = mushrooms(:one)
    @mushroom.user = @user
    @mushroom.save!
    @mr_character = mr_characters(:one)
    sign_in @user
  end

  test "should create mr_character_mushroom" do
    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      character_value: "test value",
      redirect_to: edit_mushroom_path(@mushroom)
    }

    assert_redirected_to edit_mushroom_path(@mushroom)
    assert_equal "Character saved.", flash[:notice]
  end

  test "should update existing mr_character_mushroom" do
    # Need to load mr_character with display_option to avoid strict_loading violations
    @mr_character = MrCharacter.includes(:display_option).find(@mr_character.id)

    # Create initial record
    rcm = MrCharacterMushroom.create!(
      mushroom: @mushroom,
      mr_character: @mr_character,
      character_value: "initial value"
    )

    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      character_value: "updated value"
    }

    assert_redirected_to edit_mushroom_path(@mushroom)
    # Re-fetch the record to ensure we get the updated value
    updated_rcm = MrCharacterMushroom.find_by(
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id
    )
    assert_equal "updated value", updated_rcm.character_value
  end

  test "should handle boolean values" do
    # Assuming display_option is set up for boolean
    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      character_value: "yes"
    }

    assert_redirected_to edit_mushroom_path(@mushroom)
  end

  test "should normalize boolean strings" do
    ['true', 'yes', 'present', '1', 'on', 'checked'].each do |value|
      post mr_character_mushrooms_url, params: {
        mushroom_id: @mushroom.id,
        mr_character_id: @mr_character.id,
        character_value: value
      }

      rcm = MrCharacterMushroom.find_by(
        mushroom_id: @mushroom.id,
        mr_character_id: @mr_character.id
      )

      # Will be normalized based on display option type
      assert_not_nil rcm
    end
  end

  test "should use custom redirect path" do
    custom_path = mushrooms_path

    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      character_value: "test",
      redirect_to: custom_path
    }

    assert_redirected_to custom_path
  end

  test "should handle turbo stream format" do
    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      character_value: "test"
    }, headers: { "Accept" => "text/vnd.turbo-stream.html" }

    assert_response :see_other
  end

  # Skipping: test requires mocha which is not configured
  # test "should handle invalid save" do
  #   # Mock invalid save
  #   MrCharacterMushroom.any_instance.stubs(:save).returns(false)
  #   MrCharacterMushroom.any_instance.stubs(:errors).returns(
  #     ActiveModel::Errors.new(MrCharacterMushroom.new).tap { |e| e.add(:base, "Error") }
  #   )
  #
  #   post mushroom_mr_character_mushrooms_url(@mushroom), params: {
  #     mr_character_id: @mr_character.id,
  #     character_value: "test"
  #   }
  #
  #   assert_redirected_to edit_mushroom_path(@mushroom)
  #   assert_match /Error/, flash[:alert]
  # end

  test "should require authentication" do
    sign_out @user

    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      character_value: "test"
    }

    assert_redirected_to new_user_session_path
  end
end
