# app/models/mushroom.rb
# frozen_string_literal: true

class Mushroom < ApplicationRecord
  belongs_to :user
  belongs_to :country, optional: true
  belongs_to :state, optional: true
  belongs_to :fungus_type, optional: true
  belongs_to :mushroom_storage_location, optional: true

  # Change all HABTM to has_many :through since you have join models
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

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { scope: :user_id }
  validates :country_id, presence: true
  validates :fungus_type_id, presence: true
  validates :description, length: { maximum: 4096 }
  validates :comments, length: { maximum: 4096 }
end
