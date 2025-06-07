class MrCharacterMushroom < ApplicationRecord
  belongs_to :mr_character_id
  belongs_to :mushroom_id
  belongs_to :entered_by, class_name: 'User'

end
