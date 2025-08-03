# test/models/mushroom_test.rb

require "test_helper"

class MushroomTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @mushroom = mushrooms(:one) # Refers to data in fixtures/mushrooms.yml
  end

  test "should be valid" do
    assert @mushroom.valid?
  end

  test "should not be valid without a user" do
    @mushroom.user = nil
    assert_not @mushroom.valid?, "Mushroom should not be valid without an associated user"
  end

  test "should not save without a name" do
    @mushroom.name = nil
    assert_not @mushroom.valid?
    assert_includes @mushroom.errors[:name], "Name cannot be blank."
  end

  test "should not save with a duplicate name for the same user" do
    duplicate_mushroom = @mushroom.dup
    refute duplicate_mushroom.valid?

    # Updated key matches what's in en.yml
    expected_message = I18n.t("activerecord.errors.models.mushroom.attributes.name.unique")
    assert_includes duplicate_mushroom.errors[:name], expected_message
  end

  test "should not save with description exceeding 4096 characters" do
    @mushroom.description = "a" * 4097
    refute @mushroom.valid?

    # Properly interpolate :attribute and :count placeholders
    expected_message = I18n.t("errors.messages.too_long", attribute: I18n.t("activerecord.attributes.mushroom.description"), count: 4096)
    assert_includes @mushroom.errors[:description], expected_message
  end



  test "should validate user association" do
    @mushroom.user = nil
    assert_not @mushroom.valid?
    assert_includes @mushroom.errors[:user], "User cannot be blank."
  end

  test "should respond to user association" do
    assert_respond_to @mushroom, :user
    assert_instance_of User, @mushroom.user
  end

  test "should destroy associated mr_character_mushrooms" do
    assert_difference "MrCharacterMushroom.count", -@mushroom.mr_character_mushrooms.count do
      @mushroom.destroy
    end
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

  test "should enforce unique names for the same user but allow duplicates for different users" do
    user1 = users(:one)
    user2 = users(:two)

    # Create a mushroom for user1
    mushroom1 = Mushroom.create!(name: "Mushroom Name", user: user1)

    # Attempt to create a mushroom with the same name for the same user
    duplicate_mushroom = Mushroom.new(name: "Mushroom Name", user: user1)
    assert_not duplicate_mushroom.valid?, "Duplicate name for the same user should not be valid"

    # Create a mushroom with the same name for a different user
    mushroom_for_user2 = Mushroom.new(name: "Mushroom Name", user: user2)
    assert mushroom_for_user2.valid?, "Mushrooms with the same name should be valid for different users"
  end

  test "name should not be too long" do
    @mushroom.name = "a" * 256 # Assuming 255 is the limit
    assert_not @mushroom.valid?, "Mushroom name should not exceed the character limit"
  end

  test "associated mr_character_mushrooms should be destroyed" do
    display_option = DisplayOption.create!(name: "Valid Option") # Create a valid display_option

    # Set up a valid mr_character with the appropriate relationships
    mr_character = mr_characters(:one)

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
