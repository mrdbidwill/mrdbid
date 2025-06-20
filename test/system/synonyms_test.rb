require "application_system_test_case"

class SynonymsTest < ApplicationSystemTestCase
  setup do
    @synonym = synonyms(:one)
  end

  test "visiting the index" do
    visit synonyms_url
    assert_selector "h1", text: "Synonyms"
  end

  test "should create synonym" do
    visit synonyms_url
    click_on "New synonym"

    fill_in "Comments", with: @synonym.comments
    fill_in "Description", with: @synonym.description
    fill_in "Entered by", with: @synonym.entered_by_id
    fill_in "Name", with: @synonym.name
    fill_in "Source", with: @synonym.source_id
    click_on "Create Synonym"

    assert_text "Synonym was successfully created"
    click_on "Back"
  end

  test "should update Synonym" do
    visit synonym_url(@synonym)
    click_on "Edit this synonym", match: :first

    fill_in "Comments", with: @synonym.comments
    fill_in "Description", with: @synonym.description
    fill_in "Entered by", with: @synonym.entered_by_id
    fill_in "Name", with: @synonym.name
    fill_in "Source", with: @synonym.source_id
    click_on "Update Synonym"

    assert_text "Synonym was successfully updated"
    click_on "Back"
  end

  test "should destroy Synonym" do
    visit synonym_url(@synonym)
    accept_confirm { click_on "Destroy this synonym", match: :first }

    assert_text "Synonym was successfully destroyed"
  end
end
