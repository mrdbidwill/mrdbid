class MrCharacterMushroom < ApplicationRecord
  belongs_to :mr_character
  belongs_to :mushroom

  validates :character_value, presence: true, if: -> { mr_character&.display_option&.name != "None" }
end
