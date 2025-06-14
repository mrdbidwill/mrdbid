class Mushroom < ApplicationRecord
  belongs_to :mushroom_location
  belongs_to :state
  belongs_to :country
  belongs_to :fungus_type
  belongs_to :entered_by, class_name: "User"

  has_many :cluster_mushrooms, dependent: :destroy
  has_many :clusters, through: :cluster_mushrooms

  has_many :all_group_mushrooms, dependent: :destroy
  has_many :all_groups, through: :all_group_mushrooms

  # Validation to ensure `mushroom_name` is not nil
  validates :mushroom_name, presence: true
end
