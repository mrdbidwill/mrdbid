require "test_helper"

class LookupTypeTest < ActiveSupport::TestCase
  test "should be valid with a unique name" do
    lookup_type = LookupType.new(name: "Valid Option")
    assert lookup_type.valid?
  end

  test "should not be valid without a name" do
    lookup_type = LookupType.new
    assert_not lookup_type.valid?
  end

  test "should enforce unique name validation" do
    lookup_type1 = LookupType.create!(name: "Unique Option")
    lookup_type2 = LookupType.new(name: "Unique Option")
    assert_not lookup_type2.valid?
  end
end
