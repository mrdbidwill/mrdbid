# frozen_string_literal: true

class MrCharacter < ApplicationRecord
  belongs_to :part, class_name: 'LookupItem', foreign_key: :part_id
  belongs_to :lookup_type
  belongs_to :display_option, class_name: 'LookupItem'
  belongs_to :source_data
  belongs_to :color, optional: true

  has_many :mr_character_mushrooms, dependent: :destroy
  has_many :mushrooms, through: :mr_character_mushrooms
  has_many :lookup_items, foreign_key: :mr_character_id, dependent: :nullify # Proper association with LookupItem


  validates :name, presence: true
end
