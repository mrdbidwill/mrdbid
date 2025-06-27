FactoryBot.define do
  factory :veil do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
