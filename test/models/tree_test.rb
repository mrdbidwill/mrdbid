require "test_helper"

class TreeTest < ActiveSupport::TestCase
  def setup
    @tree = trees(:one)
  end

  test "should be valid" do
    assert @tree.valid?
  end
end