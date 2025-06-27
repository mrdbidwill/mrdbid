FactoryBot.define do
  factory :mr_character do
    name { "MyString" }
    display_options { nil }
    parts { nil }
    association :source
  end
end
