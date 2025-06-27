FactoryBot.define do
  factory :possible_match do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
