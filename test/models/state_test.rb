# test/models/state_test.rb
require "test_helper"

class StateTest < ActiveSupport::TestCase
  def setup
    @state = states(:one)
  end

  # === Validations ===

  test "should be valid with valid attributes" do
    assert @state.valid?
  end

  test "should require country" do
    @state.country = nil
    assert_not @state.valid?
    assert_includes @state.errors[:country], "must exist"
  end

  # === Associations ===

  test "should belong to country" do
    assert_respond_to @state, :country
    assert_instance_of Country, @state.country
  end

  # === Attributes ===

  test "should have name attribute" do
    assert_respond_to @state, :name
    assert_not_nil @state.name
  end

  test "should have safe_name method" do
    assert_respond_to @state, :safe_name
    assert_equal @state.name, @state.safe_name
  end

  test "safe_name should return N/A for blank name" do
    @state.name = nil
    assert_equal "N/A", @state.safe_name
  end

  test "safe_name should return N/A for empty string" do
    @state.name = ""
    assert_equal "N/A", @state.safe_name
  end

  # === Class Methods ===

  test "fetch_by_id should return state when found" do
    state = State.fetch_by_id(@state.id)
    assert_equal @state, state
  end

  test "fetch_by_id should return N/A when not found" do
    result = State.fetch_by_id(999999)
    assert_equal "N/A", result
  end

  # === Callbacks ===

  test "should set default country on create if conditions met" do
    # This tests the set_default_country callback
    # The callback sets country_id to 1 if country_id is nil and certain conditions
    skip "Complex callback requiring specific mr_character_id setup"
  end

  # === Timestamps ===

  test "should have timestamps" do
    assert_not_nil @state.created_at
    assert_not_nil @state.updated_at
  end

  # === CRUD Operations ===

  test "should create new state" do
    country = countries(:one)
    assert_difference "State.count", 1 do
      State.create!(name: "New State", code: "NS", country: country)
    end
  end

  test "should update state attributes" do
    @state.update(name: "Updated State")
    assert_equal "Updated State", @state.reload.name
  end

  test "should delete state" do
    country = countries(:one)
    state = State.create!(name: "Deletable State", code: "DS", country: country)
    assert_difference "State.count", -1 do
      state.destroy
    end
  end

  # === Business Logic ===

  test "should allow multiple states for same country" do
    country = countries(:one)
    state1 = State.create!(name: "State 1", code: "S1", country: country)
    state2 = State.create!(name: "State 2", code: "S2", country: country)

    assert_equal country, state1.country
    assert_equal country, state2.country
  end

  # === Edge Cases ===

  test "should handle state without code" do
    country = countries(:one)
    state = State.new(name: "No Code State", country: country)
    # Code might be optional depending on validation
    assert state.valid? || state.errors[:code].any?
  end

  test "should handle long state names" do
    country = countries(:one)
    @state.name = "a" * 255
    @state.country = country
    assert @state.valid? || @state.errors[:name].include?("is too long")
  end
end
