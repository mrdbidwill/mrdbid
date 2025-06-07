require "test_helper"

class SourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source = data_sources(:one)
  end

  test "should get index" do
    get data_sources_url
    assert_response :success
  end

  test "should get new" do
    get new_data_source_url
    assert_response :success
  end

  test "should create source" do
    assert_difference("Source.count") do
      post data_sources_url, params: { source: { author: @source.author, comment: @source.comment, entered_by_id: @source.entered_by_id, item_code: @source.item_code, my_comment: @source.my_comment, my_rating: @source.my_rating, ref: @source.ref, title: @source.title } }
    end

    assert_redirected_to data_source_url(Source.last)
  end

  test "should show source" do
    get data_source_url(@source)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_source_url(@source)
    assert_response :success
  end

  test "should update source" do
    patch data_source_url(@source), params: { source: { author: @source.author, comment: @source.comment, entered_by_id: @source.entered_by_id, item_code: @source.item_code, my_comment: @source.my_comment, my_rating: @source.my_rating, ref: @source.ref, title: @source.title } }
    assert_redirected_to data_source_url(@source)
  end

  test "should destroy source" do
    assert_difference("Source.count", -1) do
      delete data_source_url(@source)
    end

    assert_redirected_to data_sources_url
  end
end
