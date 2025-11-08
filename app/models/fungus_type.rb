# frozen_string_literal: true

class FungusType < ApplicationRecord
  has_many :mushrooms, dependent: :restrict_with_error
  has_many :mr_characters, dependent: :nullify

  validates :name, presence: true, uniqueness: true
end
