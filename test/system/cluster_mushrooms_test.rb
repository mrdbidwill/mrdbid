require "application_system_test_case"

class ClusterMushroomsTest < ApplicationSystemTestCase
  setup do
    @cluster_mushroom = cluster_mushrooms(:one)
  end

  test "visiting the index" do
    visit cluster_mushrooms_url
    assert_selector "h1", text: "Cluster mushrooms"
  end

  test "should create cluster mushroom" do
    visit cluster_mushrooms_url
    click_on "New cluster mushroom"

    fill_in "Cluster id", with: @cluster_mushroom.cluster_id_id
    fill_in "Mushroom id", with: @cluster_mushroom.mushroom_id_id
    click_on "Create Cluster mushroom"

    assert_text "Cluster mushroom was successfully created"
    click_on "Back"
  end

  test "should update Cluster mushroom" do
    visit cluster_mushroom_url(@cluster_mushroom)
    click_on "Edit this cluster mushroom", match: :first

    fill_in "Cluster id", with: @cluster_mushroom.cluster_id_id
    fill_in "Mushroom id", with: @cluster_mushroom.mushroom_id_id
    click_on "Update Cluster mushroom"

    assert_text "Cluster mushroom was successfully updated"
    click_on "Back"
  end

  test "should destroy Cluster mushroom" do
    visit cluster_mushroom_url(@cluster_mushroom)
    accept_confirm { click_on "Destroy this cluster mushroom", match: :first }

    assert_text "Cluster mushroom was successfully destroyed"
  end
end
