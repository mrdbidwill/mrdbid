class MushroomPlant < ApplicationRecord
  belongs_to :plant
  belongs_to :mushroom, counter_cache: :plants_count
end
