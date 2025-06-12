require "application_system_test_case"

class ProjectBelongsTosTest < ApplicationSystemTestCase
  setup do
    @project_belongs_to = project_belongs_tos(:one)
  end

  test "visiting the index" do
    visit project_belongs_tos_url
    assert_selector "h1", text: "Project belongs tos"
  end

  test "should create project belongs to" do
    visit project_belongs_tos_url
    click_on "New project belongs to"

    fill_in "Comments", with: @project_belongs_to.comments
    fill_in "Description", with: @project_belongs_to.description
    fill_in "Entered by", with: @project_belongs_to.entered_by_id
    fill_in "Name", with: @project_belongs_to.name
    fill_in "Source", with: @project_belongs_to.source_id
    click_on "Create Project belongs to"

    assert_text "Project belongs to was successfully created"
    click_on "Back"
  end

  test "should update Project belongs to" do
    visit project_belongs_to_url(@project_belongs_to)
    click_on "Edit this project belongs to", match: :first

    fill_in "Comments", with: @project_belongs_to.comments
    fill_in "Description", with: @project_belongs_to.description
    fill_in "Entered by", with: @project_belongs_to.entered_by_id
    fill_in "Name", with: @project_belongs_to.name
    fill_in "Source", with: @project_belongs_to.source_id
    click_on "Update Project belongs to"

    assert_text "Project belongs to was successfully updated"
    click_on "Back"
  end

  test "should destroy Project belongs to" do
    visit project_belongs_to_url(@project_belongs_to)
    accept_confirm { click_on "Destroy this project belongs to", match: :first }

    assert_text "Project belongs to was successfully destroyed"
  end
end
