# app/models/source_data.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :source_data do  # data?
      title { "Mushroom Encyclopedia" }
      author { "John Smith" }
      ref { "ISBN 123-456-789" }
      source_data_type { 0 } # book
  end
  end
