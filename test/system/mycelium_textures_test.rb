require "application_system_test_case"

class MyceliumTexturesTest < ApplicationSystemTestCase
  setup do
    @mycelium_texture = mycelium_textures(:one)
  end

  test "visiting the index" do
    visit mycelium_textures_url
    assert_selector "h1", text: "Mycelium textures"
  end

  test "should create mycelium texture" do
    visit mycelium_textures_url
    click_on "New mycelium texture"

    fill_in "Comments", with: @mycelium_texture.comments
    fill_in "Description", with: @mycelium_texture.description
    fill_in "Entered by", with: @mycelium_texture.entered_by_id
    fill_in "Name", with: @mycelium_texture.name
    fill_in "Source", with: @mycelium_texture.source_id
    click_on "Create Mycelium texture"

    assert_text "Mycelium texture was successfully created"
    click_on "Back"
  end

  test "should update Mycelium texture" do
    visit mycelium_texture_url(@mycelium_texture)
    click_on "Edit this mycelium texture", match: :first

    fill_in "Comments", with: @mycelium_texture.comments
    fill_in "Description", with: @mycelium_texture.description
    fill_in "Entered by", with: @mycelium_texture.entered_by_id
    fill_in "Name", with: @mycelium_texture.name
    fill_in "Source", with: @mycelium_texture.source_id
    click_on "Update Mycelium texture"

    assert_text "Mycelium texture was successfully updated"
    click_on "Back"
  end

  test "should destroy Mycelium texture" do
    visit mycelium_texture_url(@mycelium_texture)
    accept_confirm { click_on "Destroy this mycelium texture", match: :first }

    assert_text "Mycelium texture was successfully destroyed"
  end
end
