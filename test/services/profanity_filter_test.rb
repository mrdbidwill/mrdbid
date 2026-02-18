require 'test_helper'

class ProfanityFilterTest < ActiveSupport::TestCase
  test "contains_profanity? returns false for blank text" do
    assert_not ProfanityFilter.contains_profanity?(nil)
    assert_not ProfanityFilter.contains_profanity?("")
    assert_not ProfanityFilter.contains_profanity?("   ")
  end

  test "contains_profanity? returns false for clean text" do
    assert_not ProfanityFilter.contains_profanity?("This is a clean description of a mushroom")
    assert_not ProfanityFilter.contains_profanity?("Beautiful Amanita muscaria found in the forest")
  end

  test "contains_profanity? detects inappropriate language" do
    # The Obscenity gem maintains its own word list
    # We're testing the integration, not the specific words
    # Using a word that is definitely in the Obscenity blacklist
    assert ProfanityFilter.contains_profanity?("fuck")
  end

  test "contains_profanity? strips HTML tags before checking" do
    assert ProfanityFilter.contains_profanity?("<p>fuck</p>")
    assert_not ProfanityFilter.contains_profanity?("<p>Beautiful mushroom</p>")
  end

  test "find_profanity returns empty array for clean text" do
    result = ProfanityFilter.find_profanity("Clean mushroom description")
    assert_equal [], result
  end

  test "find_profanity returns indicator for inappropriate text" do
    result = ProfanityFilter.find_profanity("fuck")
    assert_equal ["inappropriate content"], result
  end

  test "find_profanity returns empty array for blank text" do
    assert_equal [], ProfanityFilter.find_profanity(nil)
    assert_equal [], ProfanityFilter.find_profanity("")
  end
end
