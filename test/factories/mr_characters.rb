# frozen_string_literal: true

FactoryBot.define do
  factory :mr_character do
    name { 'MyString' }
    display_option { nil }
    part { nil }
    source_data { nil }
  end
end
