require "application_system_test_case"

class DataSourceDataTypesTest < ApplicationSystemTestCase
  setup do
    @data_source_data_type = data_source_data_types(:one)
  end

  test "visiting the index" do
    visit data_source_data_types_url
    assert_selector "h1", text: "Data source data types"
  end

  test "should create data source data type" do
    visit data_source_data_types_url
    click_on "New data source data type"

    fill_in "Comments", with: @data_source_data_type.comments
    fill_in "Description", with: @data_source_data_type.description
    fill_in "Entered by", with: @data_source_data_type.entered_by_id
    fill_in "Name", with: @data_source_data_type.name
    fill_in "Source", with: @data_source_data_type.source_id
    click_on "Create Data source data type"

    assert_text "Data source data type was successfully created"
    click_on "Back"
  end

  test "should update Data source data type" do
    visit data_source_data_type_url(@data_source_data_type)
    click_on "Edit this data source data type", match: :first

    fill_in "Comments", with: @data_source_data_type.comments
    fill_in "Description", with: @data_source_data_type.description
    fill_in "Entered by", with: @data_source_data_type.entered_by_id
    fill_in "Name", with: @data_source_data_type.name
    fill_in "Source", with: @data_source_data_type.source_id
    click_on "Update Data source data type"

    assert_text "Data source data type was successfully updated"
    click_on "Back"
  end

  test "should destroy Data source data type" do
    visit data_source_data_type_url(@data_source_data_type)
    accept_confirm { click_on "Destroy this data source data type", match: :first }

    assert_text "Data source data type was successfully destroyed"
  end
end
