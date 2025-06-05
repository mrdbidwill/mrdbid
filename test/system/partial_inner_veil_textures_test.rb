require "application_system_test_case"

class PartialInnerVeilTexturesTest < ApplicationSystemTestCase
  setup do
    @partial_inner_veil_texture = partial_inner_veil_textures(:one)
  end

  test "visiting the index" do
    visit partial_inner_veil_textures_url
    assert_selector "h1", text: "Partial inner veil textures"
  end

  test "should create partial inner veil texture" do
    visit partial_inner_veil_textures_url
    click_on "New partial inner veil texture"

    fill_in "Comments", with: @partial_inner_veil_texture.comments
    fill_in "Description", with: @partial_inner_veil_texture.description
    fill_in "Entered by", with: @partial_inner_veil_texture.entered_by_id
    fill_in "Name", with: @partial_inner_veil_texture.name
    fill_in "Source", with: @partial_inner_veil_texture.source_id
    click_on "Create Partial inner veil texture"

    assert_text "Partial inner veil texture was successfully created"
    click_on "Back"
  end

  test "should update Partial inner veil texture" do
    visit partial_inner_veil_texture_url(@partial_inner_veil_texture)
    click_on "Edit this partial inner veil texture", match: :first

    fill_in "Comments", with: @partial_inner_veil_texture.comments
    fill_in "Description", with: @partial_inner_veil_texture.description
    fill_in "Entered by", with: @partial_inner_veil_texture.entered_by_id
    fill_in "Name", with: @partial_inner_veil_texture.name
    fill_in "Source", with: @partial_inner_veil_texture.source_id
    click_on "Update Partial inner veil texture"

    assert_text "Partial inner veil texture was successfully updated"
    click_on "Back"
  end

  test "should destroy Partial inner veil texture" do
    visit partial_inner_veil_texture_url(@partial_inner_veil_texture)
    accept_confirm { click_on "Destroy this partial inner veil texture", match: :first }

    assert_text "Partial inner veil texture was successfully destroyed"
  end
end
