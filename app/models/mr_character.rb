# frozen_string_literal: true

class MrCharacter < ApplicationRecord
  has_paper_trail
  belongs_to :part, optional: true
  belongs_to :lookup_type, optional: true
  belongs_to :display_option, optional: true
  belongs_to :source_data, optional: true
  belongs_to :color, optional: true

  has_many :mr_character_mushrooms, dependent: :destroy
  has_many :mushrooms, through: :mr_character_mushrooms

  validates :name, presence: true
  validates :description, length: { maximum: 4096 }
  validates :comments, length: { maximum: 4096 }
  validates :part_id, presence: true
  validates :lookup_type_id, presence: true
  validates :display_option_id, presence: true
  validates :source_data_id, presence: true
end

