require "application_system_test_case"

class CapMarginTypesTest < ApplicationSystemTestCase
  setup do
    @cap_margin_type = cap_margin_types(:one)
  end

  test "visiting the index" do
    visit cap_margin_types_url
    assert_selector "h1", text: "Cap margin types"
  end

  test "should create cap margin type" do
    visit cap_margin_types_url
    click_on "New cap margin type"

    fill_in "Comments", with: @cap_margin_type.comments
    fill_in "Description", with: @cap_margin_type.description
    fill_in "Entered by", with: @cap_margin_type.entered_by_id
    fill_in "Name", with: @cap_margin_type.name
    fill_in "Source", with: @cap_margin_type.source_id
    click_on "Create Cap margin type"

    assert_text "Cap margin type was successfully created"
    click_on "Back"
  end

  test "should update Cap margin type" do
    visit cap_margin_type_url(@cap_margin_type)
    click_on "Edit this cap margin type", match: :first

    fill_in "Comments", with: @cap_margin_type.comments
    fill_in "Description", with: @cap_margin_type.description
    fill_in "Entered by", with: @cap_margin_type.entered_by_id
    fill_in "Name", with: @cap_margin_type.name
    fill_in "Source", with: @cap_margin_type.source_id
    click_on "Update Cap margin type"

    assert_text "Cap margin type was successfully updated"
    click_on "Back"
  end

  test "should destroy Cap margin type" do
    visit cap_margin_type_url(@cap_margin_type)
    accept_confirm { click_on "Destroy this cap margin type", match: :first }

    assert_text "Cap margin type was successfully destroyed"
  end
end
