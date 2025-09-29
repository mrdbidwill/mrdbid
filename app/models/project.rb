class Project < ApplicationRecord
  belongs_to :user
  has_many :mushroom_projects, dependent: :destroy
  has_many :mushrooms, through: :mushroom_projects

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
end