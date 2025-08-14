# frozen_string_literal: true

class MrCharacter < ApplicationRecord
  belongs_to :part, optional: true
  belongs_to :lookup_type, optional: true
  belongs_to :display_option, optional: true
  belongs_to :source_data, optional: true
  belongs_to :color, optional: true

  has_many :mr_character_mushrooms, dependent: :destroy
  has_many :mushrooms, through: :mr_character_mushrooms

  validates :name, presence: true
end

