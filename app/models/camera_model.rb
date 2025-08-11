class CameraModel < ApplicationRecord
  has_many :image_mushrooms, dependent: :nullify
end
