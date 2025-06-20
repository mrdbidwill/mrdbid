require "application_system_test_case"

class PlantsTest < ApplicationSystemTestCase
  setup do
    @plant = plants(:one)
  end

  test "visiting the index" do
    visit plants_url
    assert_selector "h1", text: "Plants"
  end

  test "should create plant" do
    visit plants_url
    click_on "New plant"

    fill_in "Comments", with: @plant.comments
    fill_in "Description", with: @plant.description
    fill_in "Entered by", with: @plant.entered_by_id
    fill_in "Name", with: @plant.name
    fill_in "Source", with: @plant.source_id
    click_on "Create Plant"

    assert_text "Plant was successfully created"
    click_on "Back"
  end

  test "should update Plant" do
    visit plant_url(@plant)
    click_on "Edit this plant", match: :first

    fill_in "Comments", with: @plant.comments
    fill_in "Description", with: @plant.description
    fill_in "Entered by", with: @plant.entered_by_id
    fill_in "Name", with: @plant.name
    fill_in "Source", with: @plant.source_id
    click_on "Update Plant"

    assert_text "Plant was successfully updated"
    click_on "Back"
  end

  test "should destroy Plant" do
    visit plant_url(@plant)
    accept_confirm { click_on "Destroy this plant", match: :first }

    assert_text "Plant was successfully destroyed"
  end
end
