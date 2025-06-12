require "application_system_test_case"

class DisplayOptionsTest < ApplicationSystemTestCase
  setup do
    @display_option = display_options(:one)
  end

  test "visiting the index" do
    visit display_options_url
    assert_selector "h1", text: "Display options"
  end

  test "should create display option" do
    visit display_options_url
    click_on "New display option"

    fill_in "Comments", with: @display_option.comments
    fill_in "Description", with: @display_option.description
    fill_in "Entered by", with: @display_option.entered_by_id
    fill_in "Name", with: @display_option.name
    fill_in "Source", with: @display_option.source_id
    click_on "Create Display option"

    assert_text "Display option was successfully created"
    click_on "Back"
  end

  test "should update Display option" do
    visit display_option_url(@display_option)
    click_on "Edit this display option", match: :first

    fill_in "Comments", with: @display_option.comments
    fill_in "Description", with: @display_option.description
    fill_in "Entered by", with: @display_option.entered_by_id
    fill_in "Name", with: @display_option.name
    fill_in "Source", with: @display_option.source_id
    click_on "Update Display option"

    assert_text "Display option was successfully updated"
    click_on "Back"
  end

  test "should destroy Display option" do
    visit display_option_url(@display_option)
    accept_confirm { click_on "Destroy this display option", match: :first }

    assert_text "Display option was successfully destroyed"
  end
end
