# frozen_string_literal: true

FactoryBot.define do
  factory :source_datum do
    title { 'MyString' }
    author { 'MyString' }
    ref { 'MyString' }
    item_code { 'MyString' }
    source_data_type { 1 }
    comment { 'MyText' }
  end
end
