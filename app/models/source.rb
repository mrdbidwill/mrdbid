class Source < ApplicationRecord
  belongs_to :entered_by, class_name: "User"

  validates :entered_by, presence: true # Ensure a user is linked

end
