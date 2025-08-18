class Genus < ApplicationRecord
  has_many :genus_mushrooms, dependent: :destroy
  has_many :mushrooms, through: :genus_mushrooms
  has_many :species, foreign_key: :genera_id, dependent: :destroy
end
