class ImageMushroom < ApplicationRecord
  belongs_to :mushroom
  belongs_to :part
  belongs_to :camera_make
  belongs_to :camera_model

  has_one_attached :image_file

  # Validations
  validates :image_file, presence: { message: "An image file must be selected" }
  validates :mushroom_id, presence: true # Ensure the image is linked to a mushroom
  validates :image_name, :mushroom_id, presence: true
  validates :image_width, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :image_height, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :lens, :exposure, :aperture, :iso, presence: true, allow_blank: true

  # Ensure the Mushroom is associated with the correct user if needed
  def user_id
    mushroom.user_id
  end

  # Convenience for views/tests
  def dimensions
    if image_width.present? && image_height.present?
      "#{image_width}x#{image_height}"
    else
      nil
    end
  end
end
