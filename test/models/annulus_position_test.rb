require "test_helper"

class AnnulusPositionTest < ActiveSupport::TestCase
  setup do
    @source = sources(:one)
    @user = users(:one)
    @annulus_position = AnnulusPosition.new(
      name: "Test Position",
      description: "A description",
      comments: "Some comments",
      source: @source,
      entered_by: @user
    )
  end

  test "valid annulus position" do
    assert @annulus_position.valid?
  end

  test "invalid without name" do
    @annulus_position.name = nil
    assert_not @annulus_position.valid?
    assert @annulus_position.errors[:name].any?
  end

  test "invalid without source" do
    @annulus_position.source = nil
    assert_not @annulus_position.valid?
    assert @annulus_position.errors[:source].any?
  end

  test "invalid without entered_by" do
    @annulus_position.entered_by = nil
    assert_not @annulus_position.valid?
    assert @annulus_position.errors[:entered_by].any?
  end

  test "name must be unique" do
    duplicate = @annulus_position.dup
    @annulus_position.save!
    assert_not duplicate.valid?
  end
end