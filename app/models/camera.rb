class Camera < ApplicationRecord
  # Associations
  has_many :image_mushrooms, dependent: :nullify
  belongs_to :camera_make
  belongs_to :camera_model

  # Validations
  validates :name, presence: true
  validates :camera_make, presence: true
  validates :camera_model, presence: true

  # Custom Methods
  def name_with_make_model
    "#{camera_make.name} #{camera_model.name}"
  end
end

