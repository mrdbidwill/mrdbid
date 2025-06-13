class CameraMake < ApplicationRecord
  belongs_to :source
  belongs_to :entered_by, class_name: "User"

  # Add validation for presence of name
  validates :name, presence: true
end