require "application_system_test_case"

class CapShapesTest < ApplicationSystemTestCase
  setup do
    @cap_shape = cap_shapes(:one)
  end

  test "visiting the index" do
    visit cap_shapes_url
    assert_selector "h1", text: "Cap shapes"
  end

  test "should create cap shape" do
    visit cap_shapes_url
    click_on "New cap shape"

    fill_in "Comments", with: @cap_shape.comments
    fill_in "Description", with: @cap_shape.description
    fill_in "Entered by", with: @cap_shape.entered_by_id
    fill_in "Name", with: @cap_shape.name
    fill_in "Source", with: @cap_shape.source_id
    click_on "Create Cap shape"

    assert_text "Cap shape was successfully created"
    click_on "Back"
  end

  test "should update Cap shape" do
    visit cap_shape_url(@cap_shape)
    click_on "Edit this cap shape", match: :first

    fill_in "Comments", with: @cap_shape.comments
    fill_in "Description", with: @cap_shape.description
    fill_in "Entered by", with: @cap_shape.entered_by_id
    fill_in "Name", with: @cap_shape.name
    fill_in "Source", with: @cap_shape.source_id
    click_on "Update Cap shape"

    assert_text "Cap shape was successfully updated"
    click_on "Back"
  end

  test "should destroy Cap shape" do
    visit cap_shape_url(@cap_shape)
    accept_confirm { click_on "Destroy this cap shape", match: :first }

    assert_text "Cap shape was successfully destroyed"
  end
end
