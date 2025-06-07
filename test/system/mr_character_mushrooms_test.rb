require "application_system_test_case"

class MrCharacterMushroomsTest < ApplicationSystemTestCase
  setup do
    @mr_character_mushroom = mr_character_mushrooms(:one)
  end

  test "visiting the index" do
    visit mr_character_mushrooms_url
    assert_selector "h1", text: "Mr character mushrooms"
  end

  test "should create mr character mushroom" do
    visit mr_character_mushrooms_url
    click_on "New mr character mushroom"

    fill_in "Character value", with: @mr_character_mushroom.character_value
    fill_in "Entered by", with: @mr_character_mushroom.entered_by_id
    fill_in "Mr character id", with: @mr_character_mushroom.mr_character_id_id
    fill_in "Mushroom id", with: @mr_character_mushroom.mushroom_id_id
    click_on "Create Mr character mushroom"

    assert_text "Mr character mushroom was successfully created"
    click_on "Back"
  end

  test "should update Mr character mushroom" do
    visit mr_character_mushroom_url(@mr_character_mushroom)
    click_on "Edit this mr character mushroom", match: :first

    fill_in "Character value", with: @mr_character_mushroom.character_value
    fill_in "Entered by", with: @mr_character_mushroom.entered_by_id
    fill_in "Mr character id", with: @mr_character_mushroom.mr_character_id_id
    fill_in "Mushroom id", with: @mr_character_mushroom.mushroom_id_id
    click_on "Update Mr character mushroom"

    assert_text "Mr character mushroom was successfully updated"
    click_on "Back"
  end

  test "should destroy Mr character mushroom" do
    visit mr_character_mushroom_url(@mr_character_mushroom)
    accept_confirm { click_on "Destroy this mr character mushroom", match: :first }

    assert_text "Mr character mushroom was successfully destroyed"
  end
end
