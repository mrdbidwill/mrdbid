# frozen_string_literal: true

# app/models/display_option.rb
class DisplayOption < ApplicationRecord
  has_many :mr_characters
  validates :name, presence: true, uniqueness: true
end
