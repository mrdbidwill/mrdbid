require "application_system_test_case"

class DnaSequencesTest < ApplicationSystemTestCase
  setup do
    @dna_sequence = dna_sequences(:one)
  end

  test "visiting the index" do
    visit dna_sequences_url
    assert_selector "h1", text: "Dna sequences"
  end

  test "should create dna sequence" do
    visit dna_sequences_url
    click_on "New dna sequence"

    fill_in "Comments", with: @dna_sequence.comments
    fill_in "Description", with: @dna_sequence.description
    fill_in "Entered by", with: @dna_sequence.entered_by_id
    fill_in "Name", with: @dna_sequence.name
    fill_in "Source", with: @dna_sequence.source_id
    click_on "Create Dna sequence"

    assert_text "Dna sequence was successfully created"
    click_on "Back"
  end

  test "should update Dna sequence" do
    visit dna_sequence_url(@dna_sequence)
    click_on "Edit this dna sequence", match: :first

    fill_in "Comments", with: @dna_sequence.comments
    fill_in "Description", with: @dna_sequence.description
    fill_in "Entered by", with: @dna_sequence.entered_by_id
    fill_in "Name", with: @dna_sequence.name
    fill_in "Source", with: @dna_sequence.source_id
    click_on "Update Dna sequence"

    assert_text "Dna sequence was successfully updated"
    click_on "Back"
  end

  test "should destroy Dna sequence" do
    visit dna_sequence_url(@dna_sequence)
    accept_confirm { click_on "Destroy this dna sequence", match: :first }

    assert_text "Dna sequence was successfully destroyed"
  end
end
