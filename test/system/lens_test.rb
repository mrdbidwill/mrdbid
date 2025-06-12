require "application_system_test_case"

class LensTest < ApplicationSystemTestCase
  setup do
    @len = lens(:one)
  end

  test "visiting the index" do
    visit lens_url
    assert_selector "h1", text: "Lens"
  end

  test "should create len" do
    visit lens_url
    click_on "New len"

    fill_in "Entered by", with: @len.entered_by_id
    fill_in "Lens make", with: @len.lens_make_id
    fill_in "Lens model", with: @len.lens_model
    click_on "Create Len"

    assert_text "Len was successfully created"
    click_on "Back"
  end

  test "should update Len" do
    visit len_url(@len)
    click_on "Edit this len", match: :first

    fill_in "Entered by", with: @len.entered_by_id
    fill_in "Lens make", with: @len.lens_make_id
    fill_in "Lens model", with: @len.lens_model
    click_on "Update Len"

    assert_text "Len was successfully updated"
    click_on "Back"
  end

  test "should destroy Len" do
    visit len_url(@len)
    accept_confirm { click_on "Destroy this len", match: :first }

    assert_text "Len was successfully destroyed"
  end
end
