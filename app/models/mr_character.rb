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
  has_many :lookup_items, dependent: :destroy

  validates :name, presence: true
  validates :description, length: { maximum: 4096 }
  validates :comments, length: { maximum: 4096 }
  validates :part_id, presence: true
  validates :lookup_type_id, presence: true
  validates :display_option_id, presence: true
  validates :source_data_id, presence: true

  # Callbacks to expire cache when characters are modified
  after_save :expire_character_cache
  after_destroy :expire_character_cache

  # Cached version of all characters with associations
  # Cache key automatically updates when any character is modified
  def self.cached_all_with_associations
    cache_key = ['mr_characters', 'all_with_associations', maximum(:updated_at)&.to_i || 0]
    Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      includes(:part, :display_option, :source_data)
        .order('parts.name ASC, mr_characters.name ASC')
        .to_a
    end
  end

  private

  def expire_character_cache
    # Clear the cache when any character is modified
    Rails.cache.delete_matched('mr_characters/all_with_associations/*')
  end
end

