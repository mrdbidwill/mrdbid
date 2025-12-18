class Color < ApplicationRecord
  has_many :mr_character_mushroom_colors, dependent: :destroy, strict_loading: false
  has_many :mr_character_mushrooms, through: :mr_character_mushroom_colors

  validates :latin_name, :common_name, presence: true

  # Scope to order colors by their sequence in the AMS chart
  scope :by_sequence, -> { order(sequence: :asc) }

  # Scope to find colors by group
  scope :by_group, ->(group) { where(color_group: group) }
end
