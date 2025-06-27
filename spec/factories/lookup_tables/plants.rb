FactoryBot.define do
  factory :plant do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
