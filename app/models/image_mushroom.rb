class ImageMushroom < ApplicationRecord
  # Associations
  belongs_to :mushroom
  belongs_to :part, class_name: 'LookupItem' # Assuming `LookupItem` is used for different "parts"
  belongs_to :camera_make, class_name: 'LookupItem', optional: true
  belongs_to :camera_model, class_name: 'LookupItem', optional: true

  # Validations
  validates :image_file_address, presence: true # Ensure an image file is provided
  validates :mushroom_id, presence: true # Ensure the image is linked to a mushroom
  validates :image_name, presence: true
  validates :image_width, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :image_height, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :lens, :exposure, :aperture, :iso, presence: true, allow_blank: true

  # Methods (if needed in the future, e.g., derived fields)
  def dimensions
    "#{image_width}x#{image_height}" if image_width && image_height
  end
end
