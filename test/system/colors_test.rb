require "application_system_test_case"

class ColorsTest < ApplicationSystemTestCase
  setup do
    @color = colors(:one)
  end

  test "visiting the index" do
    visit colors_url
    assert_selector "h1", text: "Colors"
  end

  test "should create color" do
    visit colors_url
    click_on "New color"

    fill_in "B val", with: @color.b_val
    fill_in "Closest websafe color", with: @color.closest_websafe_color
    fill_in "Color group", with: @color.color_group
    fill_in "Common name", with: @color.common_name
    fill_in "G val", with: @color.g_val
    fill_in "Hex", with: @color.hex
    fill_in "Latin name", with: @color.latin_name
    fill_in "Metadata", with: @color.metadata
    fill_in "R val", with: @color.r_val
    click_on "Create Color"

    assert_text "Color was successfully created"
    click_on "Back"
  end

  test "should update Color" do
    visit color_url(@color)
    click_on "Edit this color", match: :first

    fill_in "B val", with: @color.b_val
    fill_in "Closest websafe color", with: @color.closest_websafe_color
    fill_in "Color group", with: @color.color_group
    fill_in "Common name", with: @color.common_name
    fill_in "G val", with: @color.g_val
    fill_in "Hex", with: @color.hex
    fill_in "Latin name", with: @color.latin_name
    fill_in "Metadata", with: @color.metadata
    fill_in "R val", with: @color.r_val
    click_on "Update Color"

    assert_text "Color was successfully updated"
    click_on "Back"
  end

  test "should destroy Color" do
    visit color_url(@color)
    accept_confirm { click_on "Destroy this color", match: :first }

    assert_text "Color was successfully destroyed"
  end
end
