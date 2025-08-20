require "test_helper"

class CameraMakeTest < ActiveSupport::TestCase
  def setup
    @camera_make = CameraMake.new(name: "Test Make", description: "Test Description")
  end

  test "should be valid with valid attributes" do
    assert @camera_make.valid?
  end

  test "should not be valid without a name" do
    @camera_make.name = nil
    assert_not @camera_make.valid?
    assert @camera_make.errors.added?(:name, :blank)
  end

  test "can have many cameras" do
    @camera_make.save! # ensure the parent is persisted before attaching children
    assert_difference "@camera_make.cameras.count", 1 do
      cameras(:one).update!(camera_make: @camera_make)
    end
  end
end


