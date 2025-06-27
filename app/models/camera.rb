class Camera < ApplicationRecord
  belongs_to :camera_make
  belongs_to :camera_model
  belongs_to :lens
end
