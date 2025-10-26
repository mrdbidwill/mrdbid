# frozen_string_literal: true

class MrCharacter < ApplicationRecord
  has_paper_trail
  belongs_to :part
  belongs_to :lookup_type
  belongs_to :display_option
  belongs_to :source_data
  belongs_to :color, optional: true

  has_many :mr_character_mushrooms, dependent: :destroy
  has_many :mushrooms, through: :mr_character_mushrooms
  has_many :lookup_items, dependent: :destroy

  validates :name, presence: true
  validates :description, length: { maximum: 4096 }
  validates :comments, length: { maximum: 4096 }
  validates :part_id, presence: true
  validates :lookup_type_id, presence: true
  validates :display_option_id, presence: true
  validates :source_data_id, presence: true

  # Cached version of all characters with associations
  # Cache key automatically updates when any character is modified via maximum(:updated_at)
  def self.cached_all_with_associations
    cache_key = ['mr_characters', 'all_with_associations', maximum(:updated_at)&.to_i || 0]
    Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      includes(:part, :display_option, :source_data)
        .joins(:part)
        .order('parts.name ASC, mr_characters.name ASC')
        .to_a
    end
  end
end

