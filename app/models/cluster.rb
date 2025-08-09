class Cluster < ApplicationRecord
  belongs_to :user
  has_many :cluster_mushrooms
  has_many :mushrooms, through: :cluster_mushrooms
end

