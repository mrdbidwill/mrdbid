class MushroomTree < ApplicationRecord
  belongs_to :tree
  belongs_to :mushroom, counter_cache: :trees_count
end
