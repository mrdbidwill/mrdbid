class Len < ApplicationRecord
  belongs_to :lens_make
  belongs_to :entered_by, class_name: "User"
end
