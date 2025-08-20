require "test_helper"

class CameraModelTest < ActiveSupport::TestCase
  def setup
    @camera_model = CameraModel.new(name: "Test Model", description: "Test Description")
  end

  test "should be valid with valid attributes" do
    assert @camera_model.valid?
  end

  test "should not be valid without a name" do
    @camera_model.name = nil
    assert_not @camera_model.valid?
    assert @camera_model.errors.added?(:name, :blank)
  end

  test "can have many cameras" do
    @camera_model.save! # ensure the parent is persisted before attaching children
    assert_difference "@camera_model.cameras.count", 1 do
      cameras(:one).update!(camera_model: @camera_model)
    end
  end
end


