# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :states, foreign_key: :country_id
  has_many :mushrooms, dependent: :nullify
end
