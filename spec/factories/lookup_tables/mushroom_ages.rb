FactoryBot.define do
  factory :mushroom_age do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
