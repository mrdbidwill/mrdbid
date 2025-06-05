require "test_helper"

class PossibleMatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @possible_match = possible_matches(:one)
  end

  test "should get index" do
    get possible_matches_url
    assert_response :success
  end

  test "should get new" do
    get new_possible_match_url
    assert_response :success
  end

  test "should create possible_match" do
    assert_difference("PossibleMatch.count") do
      post possible_matches_url, params: { possible_match: { comments: @possible_match.comments, description: @possible_match.description, entered_by_id: @possible_match.entered_by_id, name: @possible_match.name, source_id: @possible_match.source_id } }
    end

    assert_redirected_to possible_match_url(PossibleMatch.last)
  end

  test "should show possible_match" do
    get possible_match_url(@possible_match)
    assert_response :success
  end

  test "should get edit" do
    get edit_possible_match_url(@possible_match)
    assert_response :success
  end

  test "should update possible_match" do
    patch possible_match_url(@possible_match), params: { possible_match: { comments: @possible_match.comments, description: @possible_match.description, entered_by_id: @possible_match.entered_by_id, name: @possible_match.name, source_id: @possible_match.source_id } }
    assert_redirected_to possible_match_url(@possible_match)
  end

  test "should destroy possible_match" do
    assert_difference("PossibleMatch.count", -1) do
      delete possible_match_url(@possible_match)
    end

    assert_redirected_to possible_matches_url
  end
end
