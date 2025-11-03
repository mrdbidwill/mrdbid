# test/models/lookup_item_test.rb
require "test_helper"

class LookupItemTest < ActiveSupport::TestCase
  def setup
    @lookup_item = lookup_items(:one)
  end

  test "should be valid with valid attributes" do
    assert @lookup_item.valid?
  end

  test "should require name" do
    lookup_item = LookupItem.new
    assert_not lookup_item.valid?
    assert_includes lookup_item.errors[:name], "Name cannot be blank."
  end

  test "should have paper_trail versioning" do
    assert_respond_to @lookup_item, :versions
  end

  test "should disable inheritance_column" do
    assert_equal :_type_disabled, LookupItem.inheritance_column.to_sym
  end

  test "should belong to source_data optionally" do
    assert_respond_to @lookup_item, :source_data
    lookup_item = LookupItem.new(name: "Test")
    assert lookup_item.valid? || !lookup_item.errors[:source_data].include?("must exist")
  end

  test "should belong to mr_character optionally" do
    assert_respond_to @lookup_item, :mr_character
  end

  test "should have by_lookup_type_name scope" do
    assert_respond_to LookupItem, :by_lookup_type_name
  end

  test "should have countries scope" do
    assert_respond_to LookupItem, :countries
  end

  test "should have full_type method" do
    assert_respond_to @lookup_item, :full_type
  end

  test "should have timestamps" do
    assert_not_nil @lookup_item.created_at
    assert_not_nil @lookup_item.updated_at
  end
end
