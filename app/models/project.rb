class Project < ApplicationRecord
  belongs_to :user
  has_many :project_mushrooms, dependent: :destroy
  has_many :mushrooms, through: :project_mushrooms
end