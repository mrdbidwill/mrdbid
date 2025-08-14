require "test_helper"

class MushroomSpeciesTest < ActiveSupport::TestCase
  def setup
    @mushroom_species = mushroom_species(:one)
  end

  test "should be valid with valid associations" do
    assert @mushroom_species.valid?
  end
end