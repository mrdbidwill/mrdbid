class ImageMushroom < ApplicationRecord
  # Attachments
  has_one_attached :image_file

  # Associations
  belongs_to :mushroom
  belongs_to :part
  belongs_to :camera_make
  belongs_to :camera_model

  # Validations
  validates :image_file, presence: { message: "An image file must be selected" }
  validates :mushroom_id, presence: true # Ensure the image is linked to a mushroom
  validates :image_name, :mushroom_id, presence: true
  validates :image_width, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :image_height, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :lens, :exposure, :aperture, :iso, presence: true, allow_blank: true

  # Methods (if needed in the future, e.g., derived fields)
  def dimensions
    "#{image_width}x#{image_height}" if image_width && image_height
  end
end
