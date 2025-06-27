FactoryBot.define do
  factory :tree do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
