class MrCharacter < ApplicationRecord
  belongs_to :display_options
  belongs_to :parts
  belongs_to :source
  belongs_to :entered_by, class_name: "User"
end
