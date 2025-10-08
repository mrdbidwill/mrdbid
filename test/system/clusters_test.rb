require "application_system_test_case"

class ClustersTest < ApplicationSystemTestCase
  setup do
    @cluster = clusters(:one)
  end

  test "visiting the index" do
    visit clusters_url
    assert_selector "h1", text: "Clusters"
  end

  test "should create cluster" do
    visit clusters_url
    click_on "New cluster"

    fill_in "Comments", with: @cluster.comments
    fill_in "Description", with: @cluster.description
    fill_in "Name", with: @cluster.name
    click_on "Create Cluster"

    assert_text "Cluster was successfully created"
    click_on "Back"
  end

  test "should update Cluster" do
    visit cluster_url(@cluster)
    click_on "Edit this cluster", match: :first

    fill_in "Comments", with: @cluster.comments
    fill_in "Description", with: @cluster.description
    fill_in "Name", with: @cluster.name
    click_on "Update Cluster"

    assert_text "Cluster was successfully updated"
    click_on "Back"
  end

  test "should destroy Cluster" do
    visit cluster_url(@cluster)
    accept_confirm { click_on "Delete this cluster", match: :first }

    assert_text "Cluster was successfully deleted"
  end
end
