# frozen_string_literal: true

class FungusType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
