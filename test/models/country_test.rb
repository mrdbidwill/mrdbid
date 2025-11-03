# test/models/country_test.rb
require "test_helper"

class CountryTest < ActiveSupport::TestCase
  def setup
    @country = countries(:one)
  end

  # === Validations ===

  test "should be valid with valid attributes" do
    assert @country.valid?
  end

  # === Associations ===

  test "should have many states" do
    assert_respond_to @country, :states
  end

  test "should have many mushrooms" do
    assert_respond_to @country, :mushrooms
  end

  test "should return associated states" do
    state = states(:one)
    assert_includes @country.states, state if @country.states.any?
  end

  test "should return associated mushrooms" do
    mushroom = mushrooms(:one)
    assert_includes @country.mushrooms, mushroom if @country.mushrooms.any?
  end

  # === Dependent Behavior ===

  test "should nullify mushrooms when country is destroyed" do
    # Create a mushroom associated with this country for testing
    user = users(:one)
    mushroom = Mushroom.create!(
      name: "Test Mushroom for Country",
      user: user,
      country: @country,
      fungus_type: fungus_types(:one)
    )

    @country.destroy
    assert_nil mushroom.reload.country_id
  end

  test "should allow deletion when mushrooms exist" do
    country = Country.create!(name: "Test Country")
    user = users(:one)
    mushroom = Mushroom.create!(
      name: "Test Mushroom",
      user: user,
      country: country,
      fungus_type: fungus_types(:one)
    )

    assert_nothing_raised do
      country.destroy
    end
  end

  # === Attributes ===

  test "should have name attribute" do
    assert_respond_to @country, :name
    assert_not_nil @country.name
  end

  test "should have description attribute" do
    assert_respond_to @country, :description
  end

  test "should have timestamps" do
    assert_not_nil @country.created_at
    assert_not_nil @country.updated_at
  end

  # === CRUD Operations ===

  test "should create new country" do
    assert_difference "Country.count", 1 do
      Country.create!(name: "New Country")
    end
  end

  test "should update country attributes" do
    @country.update(name: "Updated Country")
    assert_equal "Updated Country", @country.reload.name
  end

  test "should delete country" do
    country = Country.create!(name: "Deletable Country")
    assert_difference "Country.count", -1 do
      country.destroy
    end
  end

  # === Business Logic ===

  test "should allow multiple states per country" do
    country = Country.create!(name: "Multi-State Country")
    state1 = State.create!(name: "State 1", country: country)
    state2 = State.create!(name: "State 2", country: country)

    assert_equal 2, country.states.count
    assert_includes country.states, state1
    assert_includes country.states, state2
  end

  test "should allow multiple mushrooms per country" do
    user = users(:one)
    country = Country.create!(name: "Multi-Mushroom Country")

    mushroom1 = Mushroom.create!(
      name: "Mushroom 1",
      user: user,
      country: country,
      fungus_type: fungus_types(:one)
    )

    mushroom2 = Mushroom.create!(
      name: "Mushroom 2",
      user: user,
      country: country,
      fungus_type: fungus_types(:one)
    )

    assert_equal 2, country.mushrooms.count
  end

  # === Edge Cases ===

  test "should handle country with no states" do
    country = Country.create!(name: "Stateless Country")
    assert_empty country.states
  end

  test "should handle country with no mushrooms" do
    country = Country.create!(name: "Mushroomless Country")
    assert_empty country.mushrooms
  end
end
