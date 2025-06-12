require "application_system_test_case"

class FungusTypesTest < ApplicationSystemTestCase
  setup do
    @fungus_type = fungus_types(:one)
  end

  test "visiting the index" do
    visit fungus_types_url
    assert_selector "h1", text: "Fungus types"
  end

  test "should create fungus type" do
    visit fungus_types_url
    click_on "New fungus type"

    fill_in "Comments", with: @fungus_type.comments
    fill_in "Description", with: @fungus_type.description
    fill_in "Entered by", with: @fungus_type.entered_by_id
    fill_in "Name", with: @fungus_type.name
    fill_in "Source", with: @fungus_type.source_id
    click_on "Create Fungus type"

    assert_text "Fungus type was successfully created"
    click_on "Back"
  end

  test "should update Fungus type" do
    visit fungus_type_url(@fungus_type)
    click_on "Edit this fungus type", match: :first

    fill_in "Comments", with: @fungus_type.comments
    fill_in "Description", with: @fungus_type.description
    fill_in "Entered by", with: @fungus_type.entered_by_id
    fill_in "Name", with: @fungus_type.name
    fill_in "Source", with: @fungus_type.source_id
    click_on "Update Fungus type"

    assert_text "Fungus type was successfully updated"
    click_on "Back"
  end

  test "should destroy Fungus type" do
    visit fungus_type_url(@fungus_type)
    accept_confirm { click_on "Destroy this fungus type", match: :first }

    assert_text "Fungus type was successfully destroyed"
  end
end
