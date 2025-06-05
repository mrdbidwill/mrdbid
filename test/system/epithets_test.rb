require "application_system_test_case"

class EpithetsTest < ApplicationSystemTestCase
  setup do
    @epithet = epithets(:one)
  end

  test "visiting the index" do
    visit epithets_url
    assert_selector "h1", text: "Epithets"
  end

  test "should create epithet" do
    visit epithets_url
    click_on "New epithet"

    fill_in "Comments", with: @epithet.comments
    fill_in "Description", with: @epithet.description
    fill_in "Entered by", with: @epithet.entered_by_id
    fill_in "Name", with: @epithet.name
    fill_in "Source", with: @epithet.source_id
    click_on "Create Epithet"

    assert_text "Epithet was successfully created"
    click_on "Back"
  end

  test "should update Epithet" do
    visit epithet_url(@epithet)
    click_on "Edit this epithet", match: :first

    fill_in "Comments", with: @epithet.comments
    fill_in "Description", with: @epithet.description
    fill_in "Entered by", with: @epithet.entered_by_id
    fill_in "Name", with: @epithet.name
    fill_in "Source", with: @epithet.source_id
    click_on "Update Epithet"

    assert_text "Epithet was successfully updated"
    click_on "Back"
  end

  test "should destroy Epithet" do
    visit epithet_url(@epithet)
    accept_confirm { click_on "Destroy this epithet", match: :first }

    assert_text "Epithet was successfully destroyed"
  end
end
