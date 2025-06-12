require "application_system_test_case"

class UniversalOuterVeilTexturesTest < ApplicationSystemTestCase
  setup do
    @universal_outer_veil_texture = universal_outer_veil_textures(:one)
  end

  test "visiting the index" do
    visit universal_outer_veil_textures_url
    assert_selector "h1", text: "Universal outer veil textures"
  end

  test "should create universal outer veil texture" do
    visit universal_outer_veil_textures_url
    click_on "New universal outer veil texture"

    fill_in "Comments", with: @universal_outer_veil_texture.comments
    fill_in "Description", with: @universal_outer_veil_texture.description
    fill_in "Entered by", with: @universal_outer_veil_texture.entered_by_id
    fill_in "Name", with: @universal_outer_veil_texture.name
    fill_in "Source", with: @universal_outer_veil_texture.source_id
    click_on "Create Universal outer veil texture"

    assert_text "Universal outer veil texture was successfully created"
    click_on "Back"
  end

  test "should update Universal outer veil texture" do
    visit universal_outer_veil_texture_url(@universal_outer_veil_texture)
    click_on "Edit this universal outer veil texture", match: :first

    fill_in "Comments", with: @universal_outer_veil_texture.comments
    fill_in "Description", with: @universal_outer_veil_texture.description
    fill_in "Entered by", with: @universal_outer_veil_texture.entered_by_id
    fill_in "Name", with: @universal_outer_veil_texture.name
    fill_in "Source", with: @universal_outer_veil_texture.source_id
    click_on "Update Universal outer veil texture"

    assert_text "Universal outer veil texture was successfully updated"
    click_on "Back"
  end

  test "should destroy Universal outer veil texture" do
    visit universal_outer_veil_texture_url(@universal_outer_veil_texture)
    accept_confirm { click_on "Destroy this universal outer veil texture", match: :first }

    assert_text "Universal outer veil texture was successfully destroyed"
  end
end
