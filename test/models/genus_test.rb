require "test_helper"

class GenusTest < ActiveSupport::TestCase
  def setup
    @genus = genera(:one)
  end

  test "should be valid with valid attributes" do
    assert @genus.valid?
  end

  test "should have many mushrooms" do
    assert_respond_to @genus, :mushrooms
  end
end