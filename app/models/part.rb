# frozen_string_literal: true

# app/models/part.rb
class Part < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end

