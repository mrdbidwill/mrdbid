require "application_system_test_case"

class SpecimenAgesTest < ApplicationSystemTestCase
  setup do
    @specimen_age = specimen_ages(:one)
  end

  test "visiting the index" do
    visit specimen_ages_url
    assert_selector "h1", text: "Specimen ages"
  end

  test "should create specimen age" do
    visit specimen_ages_url
    click_on "New specimen age"

    fill_in "Comments", with: @specimen_age.comments
    fill_in "Description", with: @specimen_age.description
    fill_in "Entered by", with: @specimen_age.entered_by_id
    fill_in "Name", with: @specimen_age.name
    fill_in "Source", with: @specimen_age.source_id
    click_on "Create Specimen age"

    assert_text "Specimen age was successfully created"
    click_on "Back"
  end

  test "should update Specimen age" do
    visit specimen_age_url(@specimen_age)
    click_on "Edit this specimen age", match: :first

    fill_in "Comments", with: @specimen_age.comments
    fill_in "Description", with: @specimen_age.description
    fill_in "Entered by", with: @specimen_age.entered_by_id
    fill_in "Name", with: @specimen_age.name
    fill_in "Source", with: @specimen_age.source_id
    click_on "Update Specimen age"

    assert_text "Specimen age was successfully updated"
    click_on "Back"
  end

  test "should destroy Specimen age" do
    visit specimen_age_url(@specimen_age)
    accept_confirm { click_on "Destroy this specimen age", match: :first }

    assert_text "Specimen age was successfully destroyed"
  end
end
