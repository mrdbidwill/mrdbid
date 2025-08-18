class Species < ApplicationRecord
  belongs_to :genera, class_name: 'Genus'
  has_many :mushroom_species, dependent: :destroy
  has_many :mushrooms, through: :mushroom_species
end

