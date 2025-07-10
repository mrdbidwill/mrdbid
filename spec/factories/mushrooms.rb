# frozen_string_literal: true

FactoryBot.define do
  factory :mushrooms do
    name { 'Test Mushroom' }
    description { 'Test Mushroom Description' }
    user
  end
end
