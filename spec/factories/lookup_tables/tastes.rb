FactoryBot.define do
  factory :taste do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
