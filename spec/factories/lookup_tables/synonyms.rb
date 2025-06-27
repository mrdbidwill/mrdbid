FactoryBot.define do
  factory :synonym do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
