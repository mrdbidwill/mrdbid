require "test_helper"

class SearchByNameTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @mushroom1 = Mushroom.create!(name: "Agaricus bisporus", user: @user)
    @mushroom2 = Mushroom.create!(name: "Boletus edulis", user: @user)
    @mushroom3 = Mushroom.create!(name: "Cantharellus cibarius", user: @user)
  end

  test "search_by_name scope should find mushrooms with matching names" do
    # Test case-insensitive search
    results = Mushroom.search_by_name("agaricus")
    assert_includes results, @mushroom1
    assert_not_includes results, @mushroom2
    assert_not_includes results, @mushroom3

    # Test partial match
    results = Mushroom.search_by_name("boletus")
    assert_includes results, @mushroom2
    assert_not_includes results, @mushroom1
    assert_not_includes results, @mushroom3

    # Test case-insensitive search with uppercase
    results = Mushroom.search_by_name("CANTHARELLUS")
    assert_includes results, @mushroom3
    assert_not_includes results, @mushroom1
    assert_not_includes results, @mushroom2
  end
end