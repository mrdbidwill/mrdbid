# app/models/mushroom.rb
# frozen_string_literal: true

class Mushroom < ApplicationRecord
  belongs_to :user
  belongs_to :country, optional: true
  belongs_to :state, optional: true
  belongs_to :fungus_type, optional: true
  belongs_to :mushroom_storage_location, optional: true

  has_and_belongs_to_many :all_groups
  has_and_belongs_to_many :clusters
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :genus_mushrooms
  has_and_belongs_to_many :mushroom_species
  has_and_belongs_to_many :mushroom_trees
  has_and_belongs_to_many :mushroom_plants

  has_many :mr_character_mushrooms, dependent: :destroy
  has_many :mr_characters, through: :mr_character_mushrooms

  has_many :image_mushrooms, dependent: :destroy
  has_many :images, through: :image_mushrooms

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { scope: :user_id }
  validates :description, length: { maximum: 4096 }
  validates :comments, length: { maximum: 4096 }
end