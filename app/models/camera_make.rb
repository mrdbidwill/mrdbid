class CameraMake < ApplicationRecord
  has_many :image_mushrooms, dependent: :nullify
end
