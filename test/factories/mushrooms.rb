# frozen_string_literal: true

FactoryBot.define do
  factory :mushroom do
    name { 'MyString' }
    description { 'MyText' }
    comment { 'MyText' }
    user { nil }
  end
end
