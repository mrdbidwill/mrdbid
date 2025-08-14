class Species < ApplicationRecord
  has_and_belongs_to_many :mushrooms, join_table: :mushroom_species
end
