require "test_helper"

class ImageMushroomTest < ActiveSupport::TestCase
  def setup
    @image_mushroom = image_mushrooms(:one)
  end

  test "should be valid" do
    assert @image_mushroom.valid?
  end

  test "should require a mushroom" do
    @image_mushroom.mushroom = nil
    assert_not @image_mushroom.valid?
    assert_includes @image_mushroom.errors[:mushroom], "must exist"
  end

  test "should require an image" do
    @image_mushroom.image_name = nil
    assert_not @image_mushroom.valid?
    assert_includes @image_mushroom.errors[:image], "must exist"
  end
end