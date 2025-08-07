require "test_helper"

class AllGroupMushroomTest < ActiveSupport::TestCase
  def setup
    @all_group_mushroom = all_group_mushrooms(:one)
  end

  test "should be valid" do
    assert @all_group_mushroom.valid?
  end

  test "should require a mushroom" do
    @all_group_mushroom.mushroom = nil
    assert_not @all_group_mushroom.valid?
    assert_includes @all_group_mushroom.errors[:mushroom], "must exist"
  end

  test "should require an all_group" do
    @all_group_mushroom.all_group = nil
    assert_not @all_group_mushroom.valid?
    assert_includes @all_group_mushroom.errors[:all_group], "must exist"
  end
end