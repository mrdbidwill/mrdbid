require "application_system_test_case"

class PreservationMethodsTest < ApplicationSystemTestCase
  setup do
    @preservation_method = preservation_methods(:one)
  end

  test "visiting the index" do
    visit preservation_methods_url
    assert_selector "h1", text: "Preservation methods"
  end

  test "should create preservation method" do
    visit preservation_methods_url
    click_on "New preservation method"

    fill_in "Comments", with: @preservation_method.comments
    fill_in "Description", with: @preservation_method.description
    fill_in "Entered by", with: @preservation_method.entered_by_id
    fill_in "Name", with: @preservation_method.name
    fill_in "Source", with: @preservation_method.source_id
    click_on "Create Preservation method"

    assert_text "Preservation method was successfully created"
    click_on "Back"
  end

  test "should update Preservation method" do
    visit preservation_method_url(@preservation_method)
    click_on "Edit this preservation method", match: :first

    fill_in "Comments", with: @preservation_method.comments
    fill_in "Description", with: @preservation_method.description
    fill_in "Entered by", with: @preservation_method.entered_by_id
    fill_in "Name", with: @preservation_method.name
    fill_in "Source", with: @preservation_method.source_id
    click_on "Update Preservation method"

    assert_text "Preservation method was successfully updated"
    click_on "Back"
  end

  test "should destroy Preservation method" do
    visit preservation_method_url(@preservation_method)
    accept_confirm { click_on "Destroy this preservation method", match: :first }

    assert_text "Preservation method was successfully destroyed"
  end
end
