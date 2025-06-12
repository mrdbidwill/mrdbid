require "application_system_test_case"

class CapMarginShapesTest < ApplicationSystemTestCase
  setup do
    @cap_margin_shape = cap_margin_shapes(:one)
  end

  test "visiting the index" do
    visit cap_margin_shapes_url
    assert_selector "h1", text: "Cap margin shapes"
  end

  test "should create cap margin shape" do
    visit cap_margin_shapes_url
    click_on "New cap margin shape"

    fill_in "Comments", with: @cap_margin_shape.comments
    fill_in "Description", with: @cap_margin_shape.description
    fill_in "Entered by", with: @cap_margin_shape.entered_by_id
    fill_in "Name", with: @cap_margin_shape.name
    fill_in "Source", with: @cap_margin_shape.source_id
    click_on "Create Cap margin shape"

    assert_text "Cap margin shape was successfully created"
    click_on "Back"
  end

  test "should update Cap margin shape" do
    visit cap_margin_shape_url(@cap_margin_shape)
    click_on "Edit this cap margin shape", match: :first

    fill_in "Comments", with: @cap_margin_shape.comments
    fill_in "Description", with: @cap_margin_shape.description
    fill_in "Entered by", with: @cap_margin_shape.entered_by_id
    fill_in "Name", with: @cap_margin_shape.name
    fill_in "Source", with: @cap_margin_shape.source_id
    click_on "Update Cap margin shape"

    assert_text "Cap margin shape was successfully updated"
    click_on "Back"
  end

  test "should destroy Cap margin shape" do
    visit cap_margin_shape_url(@cap_margin_shape)
    accept_confirm { click_on "Destroy this cap margin shape", match: :first }

    assert_text "Cap margin shape was successfully destroyed"
  end
end
