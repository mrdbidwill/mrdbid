class PlantAssociation < ApplicationRecord
  belongs_to :mushroom
  belongs_to :plant
end
