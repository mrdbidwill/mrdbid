# frozen_string_literal: true

# app/models/source_data.rb
class SourceData < ApplicationRecord
  has_many :mr_characters

  validates :title, presence: true

  enum :source_data_type, {
    book: 0,
    article: 1,
    website: 2,
    research_paper: 3,
    personal_communication: 4,
    other: 5
  }, prefix: true
end
