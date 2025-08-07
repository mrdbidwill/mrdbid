require "test_helper"

class ClusterMushroomTest < ActiveSupport::TestCase
  def setup
    @cluster_mushroom = cluster_mushrooms(:one)
  end

  test "should be valid" do
    assert @cluster_mushroom.valid?
  end

  test "should require a mushroom" do
    @cluster_mushroom.mushroom = nil
    assert_not @cluster_mushroom.valid?
    assert_includes @cluster_mushroom.errors[:mushroom], "must exist"
  end

  test "should require an cluster" do
    @cluster_mushroom.cluster = nil
    assert_not @cluster_mushroom.valid?
    assert_includes @cluster_mushroom.errors[:cluster], "must exist"
  end
end