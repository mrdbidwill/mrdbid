require "test_helper"

class ChemReactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chem_reaction = chem_reactions(:one)
  end

  test "should get index" do
    get chem_reactions_url
    assert_response :success
  end

  test "should get new" do
    get new_chem_reaction_url
    assert_response :success
  end

  test "should create chem_reaction" do
    assert_difference("ChemReaction.count") do
      post chem_reactions_url, params: { chem_reaction: { comments: @chem_reaction.comments, description: @chem_reaction.description, entered_by_id: @chem_reaction.entered_by_id, name: @chem_reaction.name, source_id: @chem_reaction.source_id } }
    end

    assert_redirected_to chem_reaction_url(ChemReaction.last)
  end

  test "should show chem_reaction" do
    get chem_reaction_url(@chem_reaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_chem_reaction_url(@chem_reaction)
    assert_response :success
  end

  test "should update chem_reaction" do
    patch chem_reaction_url(@chem_reaction), params: { chem_reaction: { comments: @chem_reaction.comments, description: @chem_reaction.description, entered_by_id: @chem_reaction.entered_by_id, name: @chem_reaction.name, source_id: @chem_reaction.source_id } }
    assert_redirected_to chem_reaction_url(@chem_reaction)
  end

  test "should destroy chem_reaction" do
    assert_difference("ChemReaction.count", -1) do
      delete chem_reaction_url(@chem_reaction)
    end

    assert_redirected_to chem_reactions_url
  end
end
