require "test_helper"

class GenusControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:one) # Reference your user fixture
    @genus = genuss(:one) # Reference your genus fixture
    sign_in @user # Devise helper to sign in the user
  end


  test "should get index" do
    get genuss_url
    assert_response :success
  end

  test "should get new" do
    get new_genus_url
    assert_response :success
  end

  test "should create genus" do
    assert_difference("Genus.count") do
      post genuss_url, params: { genus: { comments: @genus.comments, description: @genus.description, name: @genus.name } }
    end

    assert_redirected_to genus_url(Genus.last)
  end

  test "should show genus" do
    get genus_url(@genus)
    assert_response :success
  end

  test "should get edit" do
    get edit_genus_url(@genus)
    assert_response :success
  end

  test "should update genus" do
    patch genus_url(@genus), params: { genus: { comments: @genus.comments, description: @genus.description, name: @genus.name } }
    assert_redirected_to genus_url(@genus)
  end

  test "should destroy genus" do
    assert_difference("Genus.count", -1) do
      delete genus_url(@genus)
    end

    assert_redirected_to genus_url
  end
end
