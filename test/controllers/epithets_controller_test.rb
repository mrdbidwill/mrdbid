require "test_helper"

class EpithetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @epithet = epithets(:one)
  end

  test "should get index" do
    get epithets_url
    assert_response :success
  end

  test "should get new" do
    get new_epithet_url
    assert_response :success
  end

  test "should create epithet" do
    assert_difference("Epithet.count") do
      post epithets_url, params: { epithet: { comments: @epithet.comments, description: @epithet.description, entered_by_id: @epithet.entered_by_id, name: @epithet.name, source_id: @epithet.source_id } }
    end

    assert_redirected_to epithet_url(Epithet.last)
  end

  test "should show epithet" do
    get epithet_url(@epithet)
    assert_response :success
  end

  test "should get edit" do
    get edit_epithet_url(@epithet)
    assert_response :success
  end

  test "should update epithet" do
    patch epithet_url(@epithet), params: { epithet: { comments: @epithet.comments, description: @epithet.description, entered_by_id: @epithet.entered_by_id, name: @epithet.name, source_id: @epithet.source_id } }
    assert_redirected_to epithet_url(@epithet)
  end

  test "should destroy epithet" do
    assert_difference("Epithet.count", -1) do
      delete epithet_url(@epithet)
    end

    assert_redirected_to epithets_url
  end
end
