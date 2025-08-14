class Genus < ApplicationRecord
  has_and_belongs_to_many :mushrooms, join_table: :genus_mushrooms
end
