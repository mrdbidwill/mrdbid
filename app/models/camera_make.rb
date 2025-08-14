class CameraMake < ApplicationRecord
  # Associations
  has_many :cameras, dependent: :nullify

  # Optional: You can add validations
  validates :name, presence: true
end

