require "application_system_test_case"

class MrCharactersTest < ApplicationSystemTestCase
  setup do
    @mr_character = mr_characters(:one)
  end

  test "visiting the index" do
    visit mr_characters_url
    assert_selector "h1", text: "Mr characters"
  end

  test "should create mr character" do
    visit mr_characters_url
    click_on "New mr character"

    fill_in "Display options", with: @mr_character.display_options_id
    fill_in "Entered by", with: @mr_character.entered_by_id
    check "Lookup" if @mr_character.lookup
    fill_in "Name", with: @mr_character.name
    fill_in "Parts", with: @mr_character.parts_id
    fill_in "Source", with: @mr_character.source_id
    click_on "Create Mr character"

    assert_text "Mr character was successfully created"
    click_on "Back"
  end

  test "should update Mr character" do
    visit mr_character_url(@mr_character)
    click_on "Edit this mr character", match: :first

    fill_in "Display options", with: @mr_character.display_options_id
    fill_in "Entered by", with: @mr_character.entered_by_id
    check "Lookup" if @mr_character.lookup
    fill_in "Name", with: @mr_character.name
    fill_in "Parts", with: @mr_character.parts_id
    fill_in "Source", with: @mr_character.source_id
    click_on "Update Mr character"

    assert_text "Mr character was successfully updated"
    click_on "Back"
  end

  test "should destroy Mr character" do
    visit mr_character_url(@mr_character)
    accept_confirm { click_on "Destroy this mr character", match: :first }

    assert_text "Mr character was successfully destroyed"
  end
end
