require "application_system_test_case"

class GillBreadthsTest < ApplicationSystemTestCase
  setup do
    @gill_breadth = gill_breadths(:one)
  end

  test "visiting the index" do
    visit gill_breadths_url
    assert_selector "h1", text: "Gill breadths"
  end

  test "should create gill breadth" do
    visit gill_breadths_url
    click_on "New gill breadth"

    fill_in "Comments", with: @gill_breadth.comments
    fill_in "Description", with: @gill_breadth.description
    fill_in "Entered by", with: @gill_breadth.entered_by_id
    fill_in "Name", with: @gill_breadth.name
    fill_in "Source", with: @gill_breadth.source_id
    click_on "Create Gill breadth"

    assert_text "Gill breadth was successfully created"
    click_on "Back"
  end

  test "should update Gill breadth" do
    visit gill_breadth_url(@gill_breadth)
    click_on "Edit this gill breadth", match: :first

    fill_in "Comments", with: @gill_breadth.comments
    fill_in "Description", with: @gill_breadth.description
    fill_in "Entered by", with: @gill_breadth.entered_by_id
    fill_in "Name", with: @gill_breadth.name
    fill_in "Source", with: @gill_breadth.source_id
    click_on "Update Gill breadth"

    assert_text "Gill breadth was successfully updated"
    click_on "Back"
  end

  test "should destroy Gill breadth" do
    visit gill_breadth_url(@gill_breadth)
    accept_confirm { click_on "Destroy this gill breadth", match: :first }

    assert_text "Gill breadth was successfully destroyed"
  end
end
