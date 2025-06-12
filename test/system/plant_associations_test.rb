require "application_system_test_case"

class PlantAssociationsTest < ApplicationSystemTestCase
  setup do
    @plant_association = plant_associations(:one)
  end

  test "visiting the index" do
    visit plant_associations_url
    assert_selector "h1", text: "Plant associations"
  end

  test "should create plant association" do
    visit plant_associations_url
    click_on "New plant association"

    fill_in "Comments", with: @plant_association.comments
    fill_in "Description", with: @plant_association.description
    fill_in "Entered by", with: @plant_association.entered_by_id
    fill_in "Name", with: @plant_association.name
    fill_in "Source", with: @plant_association.source_id
    click_on "Create Plant association"

    assert_text "Plant association was successfully created"
    click_on "Back"
  end

  test "should update Plant association" do
    visit plant_association_url(@plant_association)
    click_on "Edit this plant association", match: :first

    fill_in "Comments", with: @plant_association.comments
    fill_in "Description", with: @plant_association.description
    fill_in "Entered by", with: @plant_association.entered_by_id
    fill_in "Name", with: @plant_association.name
    fill_in "Source", with: @plant_association.source_id
    click_on "Update Plant association"

    assert_text "Plant association was successfully updated"
    click_on "Back"
  end

  test "should destroy Plant association" do
    visit plant_association_url(@plant_association)
    accept_confirm { click_on "Destroy this plant association", match: :first }

    assert_text "Plant association was successfully destroyed"
  end
end
