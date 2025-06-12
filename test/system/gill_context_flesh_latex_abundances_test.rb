require "application_system_test_case"

class GillContextFleshLatexAbundancesTest < ApplicationSystemTestCase
  setup do
    @gill_context_flesh_latex_abundance = gill_context_flesh_latex_abundances(:one)
  end

  test "visiting the index" do
    visit gill_context_flesh_latex_abundances_url
    assert_selector "h1", text: "Gill context flesh latex abundances"
  end

  test "should create gill context flesh latex abundance" do
    visit gill_context_flesh_latex_abundances_url
    click_on "New gill context flesh latex abundance"

    fill_in "Comments", with: @gill_context_flesh_latex_abundance.comments
    fill_in "Description", with: @gill_context_flesh_latex_abundance.description
    fill_in "Entered by", with: @gill_context_flesh_latex_abundance.entered_by_id
    fill_in "Name", with: @gill_context_flesh_latex_abundance.name
    fill_in "Source", with: @gill_context_flesh_latex_abundance.source_id
    click_on "Create Gill context flesh latex abundance"

    assert_text "Gill context flesh latex abundance was successfully created"
    click_on "Back"
  end

  test "should update Gill context flesh latex abundance" do
    visit gill_context_flesh_latex_abundance_url(@gill_context_flesh_latex_abundance)
    click_on "Edit this gill context flesh latex abundance", match: :first

    fill_in "Comments", with: @gill_context_flesh_latex_abundance.comments
    fill_in "Description", with: @gill_context_flesh_latex_abundance.description
    fill_in "Entered by", with: @gill_context_flesh_latex_abundance.entered_by_id
    fill_in "Name", with: @gill_context_flesh_latex_abundance.name
    fill_in "Source", with: @gill_context_flesh_latex_abundance.source_id
    click_on "Update Gill context flesh latex abundance"

    assert_text "Gill context flesh latex abundance was successfully updated"
    click_on "Back"
  end

  test "should destroy Gill context flesh latex abundance" do
    visit gill_context_flesh_latex_abundance_url(@gill_context_flesh_latex_abundance)
    accept_confirm { click_on "Destroy this gill context flesh latex abundance", match: :first }

    assert_text "Gill context flesh latex abundance was successfully destroyed"
  end
end
