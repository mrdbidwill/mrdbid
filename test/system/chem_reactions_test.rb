require "application_system_test_case"

class ChemReactionsTest < ApplicationSystemTestCase
  setup do
    @chem_reaction = chem_reactions(:one)
  end

  test "visiting the index" do
    visit chem_reactions_url
    assert_selector "h1", text: "Chem reactions"
  end

  test "should create chem reaction" do
    visit chem_reactions_url
    click_on "New chem reaction"

    fill_in "Comments", with: @chem_reaction.comments
    fill_in "Description", with: @chem_reaction.description
    fill_in "Entered by", with: @chem_reaction.entered_by_id
    fill_in "Name", with: @chem_reaction.name
    fill_in "Source", with: @chem_reaction.source_id
    click_on "Create Chem reaction"

    assert_text "Chem reaction was successfully created"
    click_on "Back"
  end

  test "should update Chem reaction" do
    visit chem_reaction_url(@chem_reaction)
    click_on "Edit this chem reaction", match: :first

    fill_in "Comments", with: @chem_reaction.comments
    fill_in "Description", with: @chem_reaction.description
    fill_in "Entered by", with: @chem_reaction.entered_by_id
    fill_in "Name", with: @chem_reaction.name
    fill_in "Source", with: @chem_reaction.source_id
    click_on "Update Chem reaction"

    assert_text "Chem reaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Chem reaction" do
    visit chem_reaction_url(@chem_reaction)
    accept_confirm { click_on "Destroy this chem reaction", match: :first }

    assert_text "Chem reaction was successfully destroyed"
  end
end
