require "test_helper"

class GillContextFleshLatexAbundancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gill_context_flesh_latex_abundance = gill_context_flesh_latex_abundances(:one)
  end

  test "should get index" do
    get gill_context_flesh_latex_abundances_url
    assert_response :success
  end

  test "should get new" do
    get new_gill_context_flesh_latex_abundance_url
    assert_response :success
  end

  test "should create gill_context_flesh_latex_abundance" do
    assert_difference("GillContextFleshLatexAbundance.count") do
      post gill_context_flesh_latex_abundances_url, params: { gill_context_flesh_latex_abundance: { comments: @gill_context_flesh_latex_abundance.comments, description: @gill_context_flesh_latex_abundance.description, entered_by_id: @gill_context_flesh_latex_abundance.entered_by_id, name: @gill_context_flesh_latex_abundance.name, source_id: @gill_context_flesh_latex_abundance.source_id } }
    end

    assert_redirected_to gill_context_flesh_latex_abundance_url(GillContextFleshLatexAbundance.last)
  end

  test "should show gill_context_flesh_latex_abundance" do
    get gill_context_flesh_latex_abundance_url(@gill_context_flesh_latex_abundance)
    assert_response :success
  end

  test "should get edit" do
    get edit_gill_context_flesh_latex_abundance_url(@gill_context_flesh_latex_abundance)
    assert_response :success
  end

  test "should update gill_context_flesh_latex_abundance" do
    patch gill_context_flesh_latex_abundance_url(@gill_context_flesh_latex_abundance), params: { gill_context_flesh_latex_abundance: { comments: @gill_context_flesh_latex_abundance.comments, description: @gill_context_flesh_latex_abundance.description, entered_by_id: @gill_context_flesh_latex_abundance.entered_by_id, name: @gill_context_flesh_latex_abundance.name, source_id: @gill_context_flesh_latex_abundance.source_id } }
    assert_redirected_to gill_context_flesh_latex_abundance_url(@gill_context_flesh_latex_abundance)
  end

  test "should destroy gill_context_flesh_latex_abundance" do
    assert_difference("GillContextFleshLatexAbundance.count", -1) do
      delete gill_context_flesh_latex_abundance_url(@gill_context_flesh_latex_abundance)
    end

    assert_redirected_to gill_context_flesh_latex_abundances_url
  end
end
