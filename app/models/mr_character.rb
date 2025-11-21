# frozen_string_literal: true

class MrCharacter < ApplicationRecord
  has_paper_trail
  belongs_to :part
  belongs_to :observation_method
  belongs_to :display_option
  belongs_to :source_data
  belongs_to :color, optional: true
  belongs_to :fungus_type, optional: true

  has_many :mr_character_mushrooms, dependent: :destroy
  has_many :mushrooms, through: :mr_character_mushrooms
  has_many :lookup_items, dependent: :destroy

  # Virtual attribute for autocomplete
  attr_accessor :source_data_title

  # Serialize properties as JSON (MySQL stores as JSON, Rails handles conversion)
  # Properties hash stores fungus_type-specific metadata
  # Example: { gill_attachment_required: true, valid_spacings: ['close', 'crowded'] }
  attribute :properties, :json, default: {}

  validates :name, presence: true
  validates :description, length: { maximum: 4096 }
  validates :comments, length: { maximum: 4096 }
  validates :part_id, presence: true
  validates :observation_method_id, presence: true
  validates :display_option_id, presence: true
  validates :source_data_id, presence: true

  # Set source_data_id from source_data_title before validation
  before_validation :set_source_data_from_title

  # Initialize properties as empty hash if nil
  after_initialize :initialize_properties

  private

  def initialize_properties
    self.properties ||= {}
  end

  def set_source_data_from_title
    if source_data_title.present? && source_data_id.blank?
      found = SourceData.find_by(title: source_data_title)
      self.source_data_id = found.id if found
    end
  end

  # Scope: Return characters for a specific fungus type
  # NULL fungus_type_id means the character applies to ALL fungus types
  scope :for_fungus_type, ->(fungus_type_id) {
    where('fungus_type_id IS NULL OR fungus_type_id = ?', fungus_type_id)
  }

  # Cached version of all characters with associations
  # Cache key automatically updates when any character is modified via maximum(:updated_at)
  def self.cached_all_with_associations
    cache_key = ['mr_characters', 'all_with_associations', maximum(:updated_at)&.to_i || 0]
    Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      includes(:part, :display_option, :source_data, :fungus_type)
        .joins(:part)
        .order('parts.name ASC, mr_characters.name ASC')
        .to_a
    end
  end

  # Cached version for specific fungus type
  def self.cached_for_fungus_type(fungus_type_id)
    cache_key = ['mr_characters', 'fungus_type', fungus_type_id, maximum(:updated_at)&.to_i || 0]
    Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      for_fungus_type(fungus_type_id)
        .includes(:part, :display_option, :source_data, :fungus_type)
        .joins(:part)
        .order('parts.name ASC, mr_characters.name ASC')
        .to_a
    end
  end

  public

  # Convenience methods for accessing properties
  # These provide a clean API for fungus_type-specific metadata

  # Get a property value
  # Example: character.property(:gill_attachment_required) => true
  def property(key)
    properties[key.to_s]
  end

  # Set a property value
  # Example: character.set_property(:gill_attachment_required, true)
  def set_property(key, value)
    self.properties = (properties || {}).merge(key.to_s => value)
  end

  # Check if a property exists
  # Example: character.property?(:gill_attachment_required) => true
  def property?(key)
    (properties || {}).key?(key.to_s)
  end

  # Get all property keys
  # Example: character.property_keys => ['gill_attachment_required', 'valid_spacings']
  def property_keys
    (properties || {}).keys
  end
end

