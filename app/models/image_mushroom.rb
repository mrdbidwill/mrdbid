class ImageMushroom < ApplicationRecord
  belongs_to :mushroom_id
  belongs_to :parts
  belongs_to :camera_make
  belongs_to :entered_by, class_name: "User"
end
