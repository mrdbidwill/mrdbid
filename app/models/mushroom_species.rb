class MushroomSpecies < ApplicationRecord
  belongs_to :species
  belongs_to :mushroom

  # Add this validation to catch issues early
  validates :species_id, presence: true
  validates :mushroom_id, presence: true

end
