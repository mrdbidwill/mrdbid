require "application_system_test_case"

class CapContextFleshTexturesTest < ApplicationSystemTestCase
  setup do
    @cap_context_flesh_texture = cap_context_flesh_textures(:one)
  end

  test "visiting the index" do
    visit cap_context_flesh_textures_url
    assert_selector "h1", text: "Cap context flesh textures"
  end

  test "should create cap context flesh texture" do
    visit cap_context_flesh_textures_url
    click_on "New cap context flesh texture"

    fill_in "Comments", with: @cap_context_flesh_texture.comments
    fill_in "Description", with: @cap_context_flesh_texture.description
    fill_in "Entered by", with: @cap_context_flesh_texture.entered_by_id
    fill_in "Name", with: @cap_context_flesh_texture.name
    fill_in "Source", with: @cap_context_flesh_texture.source_id
    click_on "Create Cap context flesh texture"

    assert_text "Cap context flesh texture was successfully created"
    click_on "Back"
  end

  test "should update Cap context flesh texture" do
    visit cap_context_flesh_texture_url(@cap_context_flesh_texture)
    click_on "Edit this cap context flesh texture", match: :first

    fill_in "Comments", with: @cap_context_flesh_texture.comments
    fill_in "Description", with: @cap_context_flesh_texture.description
    fill_in "Entered by", with: @cap_context_flesh_texture.entered_by_id
    fill_in "Name", with: @cap_context_flesh_texture.name
    fill_in "Source", with: @cap_context_flesh_texture.source_id
    click_on "Update Cap context flesh texture"

    assert_text "Cap context flesh texture was successfully updated"
    click_on "Back"
  end

  test "should destroy Cap context flesh texture" do
    visit cap_context_flesh_texture_url(@cap_context_flesh_texture)
    accept_confirm { click_on "Destroy this cap context flesh texture", match: :first }

    assert_text "Cap context flesh texture was successfully destroyed"
  end
end
