require "application_system_test_case"

class RhizomorphTexturesTest < ApplicationSystemTestCase
  setup do
    @rhizomorph_texture = rhizomorph_textures(:one)
  end

  test "visiting the index" do
    visit rhizomorph_textures_url
    assert_selector "h1", text: "Rhizomorph textures"
  end

  test "should create rhizomorph texture" do
    visit rhizomorph_textures_url
    click_on "New rhizomorph texture"

    fill_in "Comments", with: @rhizomorph_texture.comments
    fill_in "Description", with: @rhizomorph_texture.description
    fill_in "Entered by", with: @rhizomorph_texture.entered_by_id
    fill_in "Name", with: @rhizomorph_texture.name
    fill_in "Source", with: @rhizomorph_texture.source_id
    click_on "Create Rhizomorph texture"

    assert_text "Rhizomorph texture was successfully created"
    click_on "Back"
  end

  test "should update Rhizomorph texture" do
    visit rhizomorph_texture_url(@rhizomorph_texture)
    click_on "Edit this rhizomorph texture", match: :first

    fill_in "Comments", with: @rhizomorph_texture.comments
    fill_in "Description", with: @rhizomorph_texture.description
    fill_in "Entered by", with: @rhizomorph_texture.entered_by_id
    fill_in "Name", with: @rhizomorph_texture.name
    fill_in "Source", with: @rhizomorph_texture.source_id
    click_on "Update Rhizomorph texture"

    assert_text "Rhizomorph texture was successfully updated"
    click_on "Back"
  end

  test "should destroy Rhizomorph texture" do
    visit rhizomorph_texture_url(@rhizomorph_texture)
    accept_confirm { click_on "Destroy this rhizomorph texture", match: :first }

    assert_text "Rhizomorph texture was successfully destroyed"
  end
end
