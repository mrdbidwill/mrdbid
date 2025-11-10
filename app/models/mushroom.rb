# app/models/mushroom.rb
# frozen_string_literal: true

class Mushroom < ApplicationRecord
  # Prevent mass-assignment or runtime changes to the id
  attr_readonly :id

  before_update :prevent_id_change
  after_save :invalidate_comparisons_on_character_change

  belongs_to :user
  belongs_to :country
  belongs_to :state, optional: true
  belongs_to :fungus_type
  belongs_to :mushroom_storage_location, optional: true

  has_many :all_group_mushrooms, dependent: :destroy
  has_many :all_groups, through: :all_group_mushrooms

  has_many :cluster_mushrooms, dependent: :destroy
  has_many :clusters, through: :cluster_mushrooms

  has_many :genus_mushrooms, dependent: :destroy
  has_many :genera, through: :genus_mushrooms

  has_many :mushroom_species, class_name: 'MushroomSpecies', dependent: :destroy
  has_many :species, through: :mushroom_species

  has_many :mushroom_trees, dependent: :destroy
  has_many :trees, through: :mushroom_trees

  has_many :mushroom_plants, dependent: :destroy
  has_many :plants, through: :mushroom_plants

  has_many :mushroom_projects, dependent: :destroy
  has_many :projects, through: :mushroom_projects

  has_many :mr_character_mushrooms, dependent: :destroy
  has_many :mr_characters, through: :mr_character_mushrooms

  has_many :image_mushrooms, dependent: :destroy
  has_many :images, through: :image_mushrooms

  has_many :mushroom_comparisons, dependent: :destroy
  has_many :compared_mushrooms, through: :mushroom_comparisons

  # Scopes
  scope :with_minimum_characters, ->(min_count = 10) {
    joins(:mr_character_mushrooms)
      .group('mushrooms.id')
      .having('COUNT(mr_character_mushrooms.id) >= ?', min_count)
  }
  scope :search_by_name, ->(query) { where("name LIKE ?", "%#{query}%") }

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { scope: :user_id, message: :unique }
  validates :country_id, presence: true
  validates :fungus_type_id, presence: true
  validates :date_found, presence: true, on: :create
  validates :date_found, presence: true, on: :update, if: -> { date_found_changed? || date_found.present? }
  validates :description, length: { maximum: 4096 }
  validates :comments, length: { maximum: 4096 }

  # Instance method to trigger comparison recalculation
  def recalculate_comparisons
    CompareMushroomsJob.perform_later(id) if mr_character_mushrooms.count >= CompareMushroomsJob::MINIMUM_CHARACTERS
  end

  private

  def prevent_id_change
    if will_save_change_to_id?
      errors.add(:id, "cannot be changed")
      throw :abort
    end
  end

  def invalidate_comparisons_on_character_change
    # Delete existing comparisons involving this mushroom to force recalculation
    # This is triggered when the mushroom is saved, but we only want to invalidate
    # if character data might have changed (which happens via mr_character_mushrooms)
    # Note: This is a simple approach. For optimization, you could check if
    # mr_character_mushrooms changed before invalidating.
    MushroomComparison.involving_mushroom(id).destroy_all if saved_change_to_updated_at?
  end

end
