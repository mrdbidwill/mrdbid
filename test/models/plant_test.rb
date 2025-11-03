# test/models/plant_test.rb
require "test_helper"

class PlantTest < ActiveSupport::TestCase
  def setup
    @plant = plants(:one)
  end

  # === Validations ===

  test "should be valid with valid attributes" do
    assert @plant.valid?
  end

  test "should have name attribute" do
    assert_respond_to @plant, :name
  end

  # === Associations ===

  test "should have many mushroom_plants" do
    assert_respond_to @plant, :mushroom_plants
  end

  test "should have many mushrooms through mushroom_plants" do
    assert_respond_to @plant, :mushrooms
  end

  # === Dependent Associations ===

  test "should destroy associated mushroom_plants when plant is destroyed" do
    plant = Plant.create!(name: "Test Plant")
    mushroom = mushrooms(:one)
    MushroomPlant.create!(plant: plant, mushroom: mushroom)

    # Preload associations before destroy to satisfy strict_loading
    plant.reload
    plant.mushroom_plants.load
    assert_difference "MushroomPlant.count", -1 do
      plant.destroy
    end
  end

  # === CRUD Operations ===

  test "should create new plant" do
    assert_difference "Plant.count", 1 do
      Plant.create!(name: "New Plant")
    end
  end

  test "should update plant attributes" do
    @plant.update(name: "Updated Plant")
    assert_equal "Updated Plant", @plant.reload.name
  end

  test "should delete plant" do
    plant = Plant.create!(name: "Deletable Plant")

    # Preload associations before destroy to satisfy strict_loading
    plant.reload
    plant.mushroom_plants.load
    assert_difference "Plant.count", -1 do
      plant.destroy
    end
  end

  # === Timestamps ===

  test "should have timestamps" do
    assert_not_nil @plant.created_at
    assert_not_nil @plant.updated_at
  end
end
