require "application_system_test_case"

class AllGroupMushroomsTest < ApplicationSystemTestCase
  setup do
    @all_group_mushroom = all_group_mushrooms(:one)
  end

  test "visiting the index" do
    visit all_group_mushrooms_url
    assert_selector "h1", text: "All group mushrooms"
  end

  test "should create all group mushroom" do
    visit all_group_mushrooms_url
    click_on "New all group mushroom"

    fill_in "All group id", with: @all_group_mushroom.all_group_id_id
    fill_in "Mushroom id", with: @all_group_mushroom.mushroom_id_id
    click_on "Create All group mushroom"

    assert_text "All group mushroom was successfully created"
    click_on "Back"
  end

  test "should update All group mushroom" do
    visit all_group_mushroom_url(@all_group_mushroom)
    click_on "Edit this all group mushroom", match: :first

    fill_in "All group id", with: @all_group_mushroom.all_group_id_id
    fill_in "Mushroom id", with: @all_group_mushroom.mushroom_id_id
    click_on "Update All group mushroom"

    assert_text "All group mushroom was successfully updated"
    click_on "Back"
  end

  test "should destroy All group mushroom" do
    visit all_group_mushroom_url(@all_group_mushroom)
    accept_confirm { click_on "Destroy this all group mushroom", match: :first }

    assert_text "All group mushroom was successfully destroyed"
  end
end
