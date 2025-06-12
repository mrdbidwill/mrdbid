require "application_system_test_case"

class DataSourcesTest < ApplicationSystemTestCase
  setup do
    @source = data_sources(:one)
  end

  test "visiting the index" do
    visit data_sources_url
    assert_selector "h1", text: "Data sources"
  end

  test "should create data source" do
    visit data_sources_url
    click_on "New data source"

    fill_in "Author", with: @source.author
    fill_in "Comment", with: @source.comment
    fill_in "Entered by", with: @source.entered_by_id
    fill_in "Item code", with: @source.item_code
    fill_in "My comment", with: @source.my_comment
    fill_in "My rating", with: @source.my_rating
    fill_in "Ref", with: @source.ref
    fill_in "Title", with: @source.title
    click_on "Create Data source"

    assert_text "Data source was successfully created"
    click_on "Back"
  end

  test "should update Data source" do
    visit data_source_url(@source)
    click_on "Edit this data source", match: :first

    fill_in "Author", with: @source.author
    fill_in "Comment", with: @source.comment
    fill_in "Entered by", with: @source.entered_by_id
    fill_in "Item code", with: @source.item_code
    fill_in "My comment", with: @source.my_comment
    fill_in "My rating", with: @source.my_rating
    fill_in "Ref", with: @source.ref
    fill_in "Title", with: @source.title
    click_on "Update Data source"

    assert_text "Data source was successfully updated"
    click_on "Back"
  end

  test "should destroy Data source" do
    visit data_source_url(@source)
    accept_confirm { click_on "Destroy this data source", match: :first }

    assert_text "Data source was successfully destroyed"
  end
end
