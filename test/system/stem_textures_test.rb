require "application_system_test_case"

class StemTexturesTest < ApplicationSystemTestCase
  setup do
    @stem_texture = stem_textures(:one)
  end

  test "visiting the index" do
    visit stem_textures_url
    assert_selector "h1", text: "Stem textures"
  end

  test "should create stem texture" do
    visit stem_textures_url
    click_on "New stem texture"

    fill_in "Comments", with: @stem_texture.comments
    fill_in "Description", with: @stem_texture.description
    fill_in "Entered by", with: @stem_texture.entered_by_id
    fill_in "Name", with: @stem_texture.name
    fill_in "Source", with: @stem_texture.source_id
    click_on "Create Stem texture"

    assert_text "Stem texture was successfully created"
    click_on "Back"
  end

  test "should update Stem texture" do
    visit stem_texture_url(@stem_texture)
    click_on "Edit this stem texture", match: :first

    fill_in "Comments", with: @stem_texture.comments
    fill_in "Description", with: @stem_texture.description
    fill_in "Entered by", with: @stem_texture.entered_by_id
    fill_in "Name", with: @stem_texture.name
    fill_in "Source", with: @stem_texture.source_id
    click_on "Update Stem texture"

    assert_text "Stem texture was successfully updated"
    click_on "Back"
  end

  test "should destroy Stem texture" do
    visit stem_texture_url(@stem_texture)
    accept_confirm { click_on "Destroy this stem texture", match: :first }

    assert_text "Stem texture was successfully destroyed"
  end
end
