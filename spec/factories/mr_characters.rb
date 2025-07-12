# spec/factories/mr_characters.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :mr_character do
    name { "Edibility" }
    association :display_option
    association :part
    association :source_data
  end
end
