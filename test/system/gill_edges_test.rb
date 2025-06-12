require "application_system_test_case"

class GillEdgesTest < ApplicationSystemTestCase
  setup do
    @gill_edge = gill_edges(:one)
  end

  test "visiting the index" do
    visit gill_edges_url
    assert_selector "h1", text: "Gill edges"
  end

  test "should create gill edge" do
    visit gill_edges_url
    click_on "New gill edge"

    fill_in "Description", with: @gill_edge.description
    fill_in "Name", with: @gill_edge.name
    click_on "Create Gill edge"

    assert_text "Gill edge was successfully created"
    click_on "Back"
  end

  test "should update Gill edge" do
    visit gill_edge_url(@gill_edge)
    click_on "Edit this gill edge", match: :first

    fill_in "Description", with: @gill_edge.description
    fill_in "Name", with: @gill_edge.name
    click_on "Update Gill edge"

    assert_text "Gill edge was successfully updated"
    click_on "Back"
  end

  test "should destroy Gill edge" do
    visit gill_edge_url(@gill_edge)
    accept_confirm { click_on "Destroy this gill edge", match: :first }

    assert_text "Gill edge was successfully destroyed"
  end
end
