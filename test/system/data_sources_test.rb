require "application_system_test_case"

class DataSourcesTest < ApplicationSystemTestCase
  setup do
    @data_source = data_sources(:one)
  end

  test "visiting the index" do
    visit data_sources_url
    assert_selector "h1", text: "Data sources"
  end

  test "should create data source" do
    visit data_sources_url
    click_on "New data source"

    fill_in "Comments", with: @data_source.comments
    fill_in "Description", with: @data_source.description
    fill_in "Entered by", with: @data_source.entered_by_id
    fill_in "Name", with: @data_source.name
    fill_in "Source", with: @data_source.source_id
    click_on "Create Data source"

    assert_text "Data source was successfully created"
    click_on "Back"
  end

  test "should update Data source" do
    visit data_source_url(@data_source)
    click_on "Edit this data source", match: :first

    fill_in "Comments", with: @data_source.comments
    fill_in "Description", with: @data_source.description
    fill_in "Entered by", with: @data_source.entered_by_id
    fill_in "Name", with: @data_source.name
    fill_in "Source", with: @data_source.source_id
    click_on "Update Data source"

    assert_text "Data source was successfully updated"
    click_on "Back"
  end

  test "should destroy Data source" do
    visit data_source_url(@data_source)
    accept_confirm { click_on "Destroy this data source", match: :first }

    assert_text "Data source was successfully destroyed"
  end
end
