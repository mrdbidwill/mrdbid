require "application_system_test_case"

class ToxicsTest < ApplicationSystemTestCase
  setup do
    @toxic = toxics(:one)
  end

  test "visiting the index" do
    visit toxics_url
    assert_selector "h1", text: "Toxics"
  end

  test "should create toxic" do
    visit toxics_url
    click_on "New toxic"

    fill_in "Comments", with: @toxic.comments
    fill_in "Description", with: @toxic.description
    fill_in "Entered by", with: @toxic.entered_by_id
    fill_in "Name", with: @toxic.name
    fill_in "Source", with: @toxic.source_id
    click_on "Create Toxic"

    assert_text "Toxic was successfully created"
    click_on "Back"
  end

  test "should update Toxic" do
    visit toxic_url(@toxic)
    click_on "Edit this toxic", match: :first

    fill_in "Comments", with: @toxic.comments
    fill_in "Description", with: @toxic.description
    fill_in "Entered by", with: @toxic.entered_by_id
    fill_in "Name", with: @toxic.name
    fill_in "Source", with: @toxic.source_id
    click_on "Update Toxic"

    assert_text "Toxic was successfully updated"
    click_on "Back"
  end

  test "should destroy Toxic" do
    visit toxic_url(@toxic)
    accept_confirm { click_on "Destroy this toxic", match: :first }

    assert_text "Toxic was successfully destroyed"
  end
end
