FactoryBot.define do
  factory :mushroom do
    mushroom_name { "MyString" }
    description { "MyText" }
    state { nil }
    country { nil }
    fungus_type { nil }
    mushroom_location { nil }
  end
end
