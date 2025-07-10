# frozen_string_literal: true

class MrCharacter < ApplicationRecord
  belongs_to :display_option, class_name: 'DisplayOption'
  belongs_to :part, class_name: 'Part'
  belongs_to :source_data

  has_many :mr_character_mushrooms
  has_many :mushrooms, through: :mr_character_mushrooms

  validates :name, presence: true
end
