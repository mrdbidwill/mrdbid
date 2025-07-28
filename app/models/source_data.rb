# frozen_string_literal: true

# app/models/source_data.rb

class SourceData < ApplicationRecord
  belongs_to :source_data_type
  has_many :mr_characters
  validates :title, presence: true, uniqueness: true
end
