# app/models/source_data.rb
# frozen_string_literal: true

class SourceData < ApplicationRecord
  has_many :mr_characters

  validates :title, presence: true, uniqueness: true
end
