# spec/factories/mushrooms.rb
# frozen_string_literal: true

FactoryBot.define do
  factory :mushrooms do
    name { "Amanita muscaria" }
    description { "Fly agaric mushroom" }
    association :user
  end
end
