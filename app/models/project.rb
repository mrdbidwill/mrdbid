class Project < ApplicationRecord
  belongs_to :user
  has_many :mushroom_projects, dependent: :destroy
  has_many :mushrooms, through: :mushroom_projects
end