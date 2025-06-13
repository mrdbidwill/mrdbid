class Camera < ApplicationRecord
  belongs_to :camera_make
  belongs_to :entered_by, class_name: "User"
end
