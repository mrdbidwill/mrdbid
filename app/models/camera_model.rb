class CameraModel < ApplicationRecord
  # Associations
  has_many :cameras, dependent: :nullify

  # Optional: Additional validations
  validates :name, presence: true
end

