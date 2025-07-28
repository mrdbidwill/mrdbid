require "test_helper"

class MrCharacterTest < ActiveSupport::TestCase
  def setup
    @mr_character = mr_characters(:one)
    puts "MR Character Source Data: #{@mr_character.source_data&.inspect}"
  end

  test "should be valid" do
    assert @mr_character.valid?
  end

  test "should belong to part, lookup_type, display_option, and source_data" do
    assert_not_nil @mr_character.part
    assert_not_nil @mr_character.lookup_type
    assert_not_nil @mr_character.display_option
    # assert_not_nil @mr_character.source_data
  end
end
