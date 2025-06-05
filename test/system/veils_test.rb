require "application_system_test_case"

class VeilsTest < ApplicationSystemTestCase
  setup do
    @veil = veils(:one)
  end

  test "visiting the index" do
    visit veils_url
    assert_selector "h1", text: "Veils"
  end

  test "should create veil" do
    visit veils_url
    click_on "New veil"

    fill_in "Comments", with: @veil.comments
    fill_in "Description", with: @veil.description
    fill_in "Entered by", with: @veil.entered_by_id
    fill_in "Name", with: @veil.name
    fill_in "Source", with: @veil.source_id
    click_on "Create Veil"

    assert_text "Veil was successfully created"
    click_on "Back"
  end

  test "should update Veil" do
    visit veil_url(@veil)
    click_on "Edit this veil", match: :first

    fill_in "Comments", with: @veil.comments
    fill_in "Description", with: @veil.description
    fill_in "Entered by", with: @veil.entered_by_id
    fill_in "Name", with: @veil.name
    fill_in "Source", with: @veil.source_id
    click_on "Update Veil"

    assert_text "Veil was successfully updated"
    click_on "Back"
  end

  test "should destroy Veil" do
    visit veil_url(@veil)
    accept_confirm { click_on "Destroy this veil", match: :first }

    assert_text "Veil was successfully destroyed"
  end
end
