# app/models/mushroom.rb
# frozen_string_literal: true

class Mushroom < ApplicationRecord
  belongs_to :user

  has_many :mr_character_mushrooms
  has_many :mr_characters, through: :mr_character_mushrooms


  validates :name, presence: true
  validates :user, presence: true

  # Add these associations after you've created the mushroom_lookup_items table
  # belongs_to :state, optional: true
  # belongs_to :country, optional: true
  # belongs_to :fungus_type, optional: true
  # belongs_to :mushroom_storage_location, optional: true


end
