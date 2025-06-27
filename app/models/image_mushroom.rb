class ImageMushroom < ApplicationRecord
  belongs_to :mushroom
  belongs_to :part
  belongs_to :camera_make
end
