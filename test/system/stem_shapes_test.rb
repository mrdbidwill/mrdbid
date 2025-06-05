require "application_system_test_case"

class StemShapesTest < ApplicationSystemTestCase
  setup do
    @stem_shape = stem_shapes(:one)
  end

  test "visiting the index" do
    visit stem_shapes_url
    assert_selector "h1", text: "Stem shapes"
  end

  test "should create stem shape" do
    visit stem_shapes_url
    click_on "New stem shape"

    fill_in "Comments", with: @stem_shape.comments
    fill_in "Description", with: @stem_shape.description
    fill_in "Entered by", with: @stem_shape.entered_by_id
    fill_in "Name", with: @stem_shape.name
    fill_in "Source", with: @stem_shape.source_id
    click_on "Create Stem shape"

    assert_text "Stem shape was successfully created"
    click_on "Back"
  end

  test "should update Stem shape" do
    visit stem_shape_url(@stem_shape)
    click_on "Edit this stem shape", match: :first

    fill_in "Comments", with: @stem_shape.comments
    fill_in "Description", with: @stem_shape.description
    fill_in "Entered by", with: @stem_shape.entered_by_id
    fill_in "Name", with: @stem_shape.name
    fill_in "Source", with: @stem_shape.source_id
    click_on "Update Stem shape"

    assert_text "Stem shape was successfully updated"
    click_on "Back"
  end

  test "should destroy Stem shape" do
    visit stem_shape_url(@stem_shape)
    accept_confirm { click_on "Destroy this stem shape", match: :first }

    assert_text "Stem shape was successfully destroyed"
  end
end
