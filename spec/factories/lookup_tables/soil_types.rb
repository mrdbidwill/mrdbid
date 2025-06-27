FactoryBot.define do
  factory :soil_type do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
