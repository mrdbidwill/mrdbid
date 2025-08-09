class AllGroup < ApplicationRecord
  belongs_to :user
  has_many :all_group_mushrooms
  has_many :mushrooms, through: :all_group_mushrooms
end

