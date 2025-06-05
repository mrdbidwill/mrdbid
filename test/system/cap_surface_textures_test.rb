require "application_system_test_case"

class CapSurfaceTexturesTest < ApplicationSystemTestCase
  setup do
    @cap_surface_texture = cap_surface_textures(:one)
  end

  test "visiting the index" do
    visit cap_surface_textures_url
    assert_selector "h1", text: "Cap surface textures"
  end

  test "should create cap surface texture" do
    visit cap_surface_textures_url
    click_on "New cap surface texture"

    fill_in "Comments", with: @cap_surface_texture.comments
    fill_in "Description", with: @cap_surface_texture.description
    fill_in "Entered by", with: @cap_surface_texture.entered_by_id
    fill_in "Name", with: @cap_surface_texture.name
    fill_in "Source", with: @cap_surface_texture.source_id
    click_on "Create Cap surface texture"

    assert_text "Cap surface texture was successfully created"
    click_on "Back"
  end

  test "should update Cap surface texture" do
    visit cap_surface_texture_url(@cap_surface_texture)
    click_on "Edit this cap surface texture", match: :first

    fill_in "Comments", with: @cap_surface_texture.comments
    fill_in "Description", with: @cap_surface_texture.description
    fill_in "Entered by", with: @cap_surface_texture.entered_by_id
    fill_in "Name", with: @cap_surface_texture.name
    fill_in "Source", with: @cap_surface_texture.source_id
    click_on "Update Cap surface texture"

    assert_text "Cap surface texture was successfully updated"
    click_on "Back"
  end

  test "should destroy Cap surface texture" do
    visit cap_surface_texture_url(@cap_surface_texture)
    accept_confirm { click_on "Destroy this cap surface texture", match: :first }

    assert_text "Cap surface texture was successfully destroyed"
  end
end
