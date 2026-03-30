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
    @mr_character.update!(display_option: display_options(:boolean_yes_no))

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
      assert_equal "true", rcm.character_value
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

  test "should redirect after create" do
    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      character_value: "test"
    }

    assert_redirected_to edit_mushroom_path(@mushroom)
    assert_equal "Character saved.", flash[:notice]
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

  # Multicolor tests
  test "should create mr_character_mushroom with multiple colors" do
    @mr_character.update!(display_option: display_options(:color_picker))
    color_one = colors(:one)
    color_two = colors(:two)

    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      color_ids: [color_one.id, color_two.id]
    }

    assert_redirected_to edit_mushroom_path(@mushroom)

    rcm = MrCharacterMushroom.find_by(mushroom_id: @mushroom.id, mr_character_id: @mr_character.id)
    assert_equal 2, rcm.colors.count
    assert_includes rcm.color_ids, color_one.id
    assert_includes rcm.color_ids, color_two.id
  end

  test "should update existing colors when posting new color_ids" do
    @mr_character.update!(display_option: display_options(:color_picker))

    # Create initial record via controller with one color (ID 1)
    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      color_ids: [1]
    }

    rcm = MrCharacterMushroom.includes(:colors).find_by(
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id
    )
    assert_equal 1, rcm.colors.count
    assert_equal 1, rcm.colors.first.id

    # Update with different color (ID 2)
    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      color_ids: [2]
    }

    rcm_updated = MrCharacterMushroom.includes(:colors).find_by(
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id
    )
    assert_equal 1, rcm_updated.colors.count
    assert_equal 2, rcm_updated.colors.first.id
  end

  test "should redirect after create with colors" do
    @mr_character.update!(display_option: display_options(:color_picker))
    color_one = colors(:one)

    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      color_ids: [color_one.id]
    }

    assert_redirected_to edit_mushroom_path(@mushroom)
    assert_equal "Character saved.", flash[:notice]

    rcm = MrCharacterMushroom.find_by(mushroom_id: @mushroom.id, mr_character_id: @mr_character.id)
    assert_equal 1, rcm.colors.count
  end

  test "should validate at least one color for color_character" do
    @mr_character.update!(display_option: display_options(:color_picker))

    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      color_ids: []
    }

    # Should redirect back with error
    assert_redirected_to edit_mushroom_path(@mushroom)
  end

  test "should clear persisted color character when no color values are provided" do
    color_character = MrCharacter.create!(
      name: "Test Color Character #{SecureRandom.hex(4)}",
      part: parts(:one),
      observation_method: observation_methods(:one),
      display_option: display_options(:color_picker),
      source_data: source_data(:one)
    )

    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: color_character.id,
      color_ids: [colors(:one).id]
    }
    assert_not_nil MrCharacterMushroom.find_by(mushroom_id: @mushroom.id, mr_character_id: color_character.id)

    assert_difference("MrCharacterMushroom.where(mushroom_id: @mushroom.id, mr_character_id: color_character.id).count", -1) do
      post mr_character_mushrooms_url, params: {
        mushroom_id: @mushroom.id,
        mr_character_id: color_character.id
      }
    end

    assert_redirected_to edit_mushroom_path(@mushroom)
    assert_equal "Character cleared.", flash[:notice]
  end

  test "should use next_url when save_next is present" do
    post mr_character_mushrooms_url, params: {
      mushroom_id: @mushroom.id,
      mr_character_id: @mr_character.id,
      character_value: "queued save",
      save_next: "1",
      next_url: mushrooms_path
    }

    assert_redirected_to mushrooms_path
    assert_equal "Character saved.", flash[:notice]
  end

  test "bulk update should reject empty update list" do
    post bulk_update_mr_character_mushrooms_path, params: {
      mushroom_id: @mushroom.id,
      updates: {},
      redirect_to: mushrooms_path
    }

    assert_redirected_to mushrooms_path
    assert_equal "No updates provided.", flash[:alert]
  end

  test "bulk update should save multiple characters" do
    second_character = mr_characters(:two)

    post bulk_update_mr_character_mushrooms_path, params: {
      mushroom_id: @mushroom.id,
      updates: {
        "0" => { mr_character_id: @mr_character.id, character_value: "bulk value one" },
        "1" => { mr_character_id: second_character.id, character_value: "bulk value two" }
      },
      redirect_to: mushrooms_path
    }

    assert_redirected_to mushrooms_path
    assert_equal "Successfully saved 2 characters.", flash[:notice]

    first = MrCharacterMushroom.find_by(mushroom_id: @mushroom.id, mr_character_id: @mr_character.id)
    second = MrCharacterMushroom.find_by(mushroom_id: @mushroom.id, mr_character_id: second_character.id)
    assert_equal "bulk value one", first.character_value
    assert_equal "bulk value two", second.character_value
  end

  test "bulk update should report partial errors and keep successful updates" do
    post bulk_update_mr_character_mushrooms_path, params: {
      mushroom_id: @mushroom.id,
      updates: {
        "0" => { mr_character_id: @mr_character.id, character_value: "ok value" },
        "1" => { mr_character_id: 999_999, character_value: "bad value" }
      },
      redirect_to: mushrooms_path
    }

    assert_redirected_to mushrooms_path
    assert_match(/Saved 1 characters\. Errors:/, flash[:alert])

    valid_row = MrCharacterMushroom.find_by(mushroom_id: @mushroom.id, mr_character_id: @mr_character.id)
    assert_equal "ok value", valid_row.character_value
  end
end
