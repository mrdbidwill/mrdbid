class ImageMushroomThumbnail < ApplicationRecord
  belongs_to :image_mushroom_id
  belongs_to :entered_by, class_name: "User"
end
