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
    fill_in "Cwc b", with: @color.cwc_b
    fill_in "Cwc g", with: @color.cwc_g
    fill_in "Cwc r", with: @color.cwc_r
    fill_in "Entered by", with: @color.entered_by_id
    fill_in "G val", with: @color.g_val
    fill_in "Hex", with: @color.hex
    fill_in "Image file", with: @color.image_file
    fill_in "Latin name", with: @color.latin_name
    fill_in "R val", with: @color.r_val
    fill_in "Sequence", with: @color.sequence
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
    fill_in "Cwc b", with: @color.cwc_b
    fill_in "Cwc g", with: @color.cwc_g
    fill_in "Cwc r", with: @color.cwc_r
    fill_in "Entered by", with: @color.entered_by_id
    fill_in "G val", with: @color.g_val
    fill_in "Hex", with: @color.hex
    fill_in "Image file", with: @color.image_file
    fill_in "Latin name", with: @color.latin_name
    fill_in "R val", with: @color.r_val
    fill_in "Sequence", with: @color.sequence
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
