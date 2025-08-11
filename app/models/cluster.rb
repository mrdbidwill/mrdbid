class Cluster < ApplicationRecord
  belongs_to :user
  has_many :cluster_mushrooms, dependent: :destroy
  has_many :mushrooms, through: :cluster_mushrooms
end

