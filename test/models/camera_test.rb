require "test_helper"

class CameraTest < ActiveSupport::TestCase
  def setup
    @camera_make = camera_makes(:one) # Assumes you have corresponding fixtures
    @camera_model = camera_models(:one)
    @camera = Camera.new(
      name: "Test Camera",
      description: "Test Description",
      comments: "Test Comments",
      camera_make: @camera_make,
      camera_model: @camera_model
    )
  end

  test "should be valid with valid attributes" do
    assert @camera.valid?
  end

  test "should not be valid without a name" do
    @camera.name = nil
    assert_not @camera.valid?
    assert_includes @camera.errors[:name], "can't be blank"
  end

  test "should not be valid without a camera_make" do
    @camera.camera_make = nil
    assert_not @camera.valid?
    assert_includes @camera.errors[:camera_make], "must exist"
  end

  test "should not be valid without a camera_model" do
    @camera.camera_model = nil
    assert_not @camera.valid?
    assert_includes @camera.errors[:camera_model], "must exist"
  end

  test "should return name_with_make_model correctly" do
    assert_equal "#{@camera_make.name} #{@camera_model.name}", @camera.name_with_make_model
  end

  test "deleting camera should not delete associated camera_make or camera_model" do
    @camera.save
    assert_no_difference "CameraMake.count" do
      @camera.destroy
    end
    assert_no_difference "CameraModel.count" do
      @camera.destroy
    end
  end

  test "should not allow duplicate names" do
    duplicate_camera = @camera.dup
    duplicate_camera.save
    assert_not duplicate_camera.valid?
    assert_includes duplicate_camera.errors[:name], "has already been taken"
  end

  test "description can be blank" do
    @camera.description = ""
    assert @camera.valid?
  end

  test "comments can be nil" do
    @camera.comments = nil
    assert @camera.valid?
  end

  test "should be invalid with non-existent camera_make or camera_model" do
    @camera.camera_make_id = 9999 # Non-existent ID
    @camera.camera_model_id = 9999
    assert_not @camera.valid?
    assert_includes @camera.errors[:camera_make], "must exist"
    assert_includes @camera.errors[:camera_model], "must exist"
  end

  test "destroying associated camera_make should nullify camera_make_id" do
    @camera.save
    @camera_make.destroy
    assert_nil @camera.reload.camera_make
  end

  test "should handle nil camera_make or camera_model in name_with_make_model" do
    @camera.camera_make = nil
    assert_equal "Unknown #{@camera.camera_model.name}", @camera.name_with_make_model
    @camera.camera_model = nil
    assert_equal "Unknown Unknown", @camera.name_with_make_model
  end

  test "should enforce foreign keys at the database level" do
    assert_raises(ActiveRecord::InvalidForeignKey) do
      @camera.camera_make_id = 9999
      @camera.save(validate: false) # Bypass ActiveRecord validation
    end
  end

  test "should not leave orphaned records" do
    @camera.save
    @camera.destroy
    assert_not Camera.exists?(@camera.id)
  end

  test "by_make scope should return cameras for a given make" do
    @camera.save
    assert_includes Camera.by_make(@camera_make.id), @camera
  end



end
