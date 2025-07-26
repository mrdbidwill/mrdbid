require "test_helper"

class MushroomTest < ActiveSupport::TestCase
  def setup
    @mushroom = mushrooms(:one) # Refers to data in fixtures/mushrooms.yml
  end

  test "should be valid" do
    assert @mushroom.valid?
  end

  test "should not be valid without a user" do
    @mushroom.user = nil
    assert_not @mushroom.valid?, "Mushroom should not be valid without an associated user"
  end

  test "name should be present" do
    @mushroom.name = nil
    assert_not @mushroom.valid?
  end

  test "user association should exist" do
    assert @mushroom.user
  end

  test "should respond to associated mr_characters" do
    assert_respond_to @mushroom, :mr_characters, "Mushroom should have many mr_characters"
  end

  test "should have associated mr_characters" do
    assert_equal 1, @mushroom.mr_characters.count, "Expected 1 associated mr_character"
  end

  test "name should not be too long" do
    @mushroom.name = "a" * 256 # Assuming 255 is the limit
    assert_not @mushroom.valid?, "Mushroom name should not exceed the character limit"
  end

  test "associated mr_character_mushrooms should be destroyed" do
    display_option = DisplayOption.create!(name: "Valid Option") # Create a valid display_option

    # Set up a valid mr_character with the appropriate relationships
    mr_character = MrCharacter.create!(
      name: "Unique Grilled",
      part: Part.create!(name: "Sample Part"),
      lookup_type: LookupType.create!(name: "Sample LookupType"),
      display_option: display_option,
      source_data: SourceData.create!(title: "Sample Data Source Title")
    )

    # Associate the mushroom and mr_character through MrCharacterMushroom
    mr_character_mushroom = @mushroom.mr_character_mushrooms.create!(
      mr_character: mr_character,
      character_value: "Valid value"
    )

    # Debugging to see the state of the associated records
    puts "Associated MrCharacterMushroom count before destroy: #{@mushroom.mr_character_mushrooms.count}"

    initial_count = @mushroom.mr_character_mushrooms.count
    assert_difference("MrCharacterMushroom.count", -initial_count) do
      @mushroom.destroy
    end
  end

end