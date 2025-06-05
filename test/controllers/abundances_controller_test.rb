require "test_helper"

class AbundancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @abundance = abundances(:one)
  end

  test "should get index" do
    get abundances_url
    assert_response :success
  end

  test "should get new" do
    get new_abundance_url
    assert_response :success
  end

  test "should create abundance" do
    assert_difference("Abundance.count") do
      post abundances_url, params: { abundance: { comments: @abundance.comments, description: @abundance.description, entered_by_id: @abundance.entered_by_id, name: @abundance.name, source_id: @abundance.source_id } }
    end

    assert_redirected_to abundance_url(Abundance.last)
  end

  test "should show abundance" do
    get abundance_url(@abundance)
    assert_response :success
  end

  test "should get edit" do
    get edit_abundance_url(@abundance)
    assert_response :success
  end

  test "should update abundance" do
    patch abundance_url(@abundance), params: { abundance: { comments: @abundance.comments, description: @abundance.description, entered_by_id: @abundance.entered_by_id, name: @abundance.name, source_id: @abundance.source_id } }
    assert_redirected_to abundance_url(@abundance)
  end

  test "should destroy abundance" do
    assert_difference("Abundance.count", -1) do
      delete abundance_url(@abundance)
    end

    assert_redirected_to abundances_url
  end
end
