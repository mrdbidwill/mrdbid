class Mushroom < ApplicationRecord
  belongs_to :mushroom_location
  belongs_to :state
  belongs_to :country
  belongs_to :fungus_type
  belongs_to :entered_by, class_name: "User"

  # Validation to ensure `mushroom_name` is not nil
  validates :mushroom_name, presence: true


end
