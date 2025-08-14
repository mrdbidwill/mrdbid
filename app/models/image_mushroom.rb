class ImageMushroom < ApplicationRecord
  belongs_to :mushroom
  belongs_to :part, optional: true
  belongs_to :camera, optional: true

  # Attachments and presence validations
  has_one_attached :image_file

  validates :image_file, presence: { message: "An image file must be selected" }

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
