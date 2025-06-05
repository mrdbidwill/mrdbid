require "application_system_test_case"

class OdorsTest < ApplicationSystemTestCase
  setup do
    @odor = odors(:one)
  end

  test "visiting the index" do
    visit odors_url
    assert_selector "h1", text: "Odors"
  end

  test "should create odor" do
    visit odors_url
    click_on "New odor"

    fill_in "Comments", with: @odor.comments
    fill_in "Description", with: @odor.description
    fill_in "Entered by", with: @odor.entered_by_id
    fill_in "Name", with: @odor.name
    fill_in "Source", with: @odor.source_id
    click_on "Create Odor"

    assert_text "Odor was successfully created"
    click_on "Back"
  end

  test "should update Odor" do
    visit odor_url(@odor)
    click_on "Edit this odor", match: :first

    fill_in "Comments", with: @odor.comments
    fill_in "Description", with: @odor.description
    fill_in "Entered by", with: @odor.entered_by_id
    fill_in "Name", with: @odor.name
    fill_in "Source", with: @odor.source_id
    click_on "Update Odor"

    assert_text "Odor was successfully updated"
    click_on "Back"
  end

  test "should destroy Odor" do
    visit odor_url(@odor)
    accept_confirm { click_on "Destroy this odor", match: :first }

    assert_text "Odor was successfully destroyed"
  end
end
