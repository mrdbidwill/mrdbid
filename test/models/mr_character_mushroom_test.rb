# test/models/mr_character_mushroom_test.rb
require "test_helper"

class MrCharacterMushroomTest < ActiveSupport::TestCase
  def setup
    @mushroom = mushrooms(:one)
    @mr_character = mr_characters(:one)
    @mr_character_mushroom = mr_character_mushrooms(:one)
  end

  test "should be valid with valid attributes" do
    assert @mr_character_mushroom.valid?
  end

  test "should require character_value" do
    mcm = MrCharacterMushroom.new(mr_character: @mr_character, mushroom: @mushroom)
    assert_not mcm.valid?
    assert_includes mcm.errors[:character_value], "Character value cannot be blank."
  end

  test "should belong to mr_character" do
    assert_respond_to @mr_character_mushroom, :mr_character
  end

  test "should belong to mushroom" do
    assert_respond_to @mr_character_mushroom, :mushroom
  end

  test "should increment counter_cache on mushroom" do
    mushroom = Mushroom.create!(
      name: "Test Mushroom",
      user: users(:one),
      country: countries(:one),
      fungus_type: fungus_types(:one)
    )
    initial_count = mushroom.mr_character_mushrooms_count || 0

    MrCharacterMushroom.create!(
      mushroom: mushroom,
      mr_character: @mr_character,
      character_value: "test_value"
    )

    assert_equal initial_count + 1, mushroom.reload.mr_character_mushrooms_count
  end

  test "should have colors_for_mushroom scope" do
    assert_respond_to MrCharacterMushroom, :colors_for_mushroom
  end

  test "should have timestamps" do
    assert_not_nil @mr_character_mushroom.created_at
    assert_not_nil @mr_character_mushroom.updated_at
  end
end
