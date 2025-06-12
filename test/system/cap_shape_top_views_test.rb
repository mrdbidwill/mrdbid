require "application_system_test_case"

class CapShapeTopViewsTest < ApplicationSystemTestCase
  setup do
    @cap_shape_top_view = cap_shape_top_views(:one)
  end

  test "visiting the index" do
    visit cap_shape_top_views_url
    assert_selector "h1", text: "Cap shape top views"
  end

  test "should create cap shape top view" do
    visit cap_shape_top_views_url
    click_on "New cap shape top view"

    fill_in "Comments", with: @cap_shape_top_view.comments
    fill_in "Description", with: @cap_shape_top_view.description
    fill_in "Entered by", with: @cap_shape_top_view.entered_by_id
    fill_in "Name", with: @cap_shape_top_view.name
    fill_in "Source", with: @cap_shape_top_view.source_id
    click_on "Create Cap shape top view"

    assert_text "Cap shape top view was successfully created"
    click_on "Back"
  end

  test "should update Cap shape top view" do
    visit cap_shape_top_view_url(@cap_shape_top_view)
    click_on "Edit this cap shape top view", match: :first

    fill_in "Comments", with: @cap_shape_top_view.comments
    fill_in "Description", with: @cap_shape_top_view.description
    fill_in "Entered by", with: @cap_shape_top_view.entered_by_id
    fill_in "Name", with: @cap_shape_top_view.name
    fill_in "Source", with: @cap_shape_top_view.source_id
    click_on "Update Cap shape top view"

    assert_text "Cap shape top view was successfully updated"
    click_on "Back"
  end

  test "should destroy Cap shape top view" do
    visit cap_shape_top_view_url(@cap_shape_top_view)
    accept_confirm { click_on "Destroy this cap shape top view", match: :first }

    assert_text "Cap shape top view was successfully destroyed"
  end
end
