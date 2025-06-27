FactoryBot.define do
  factory :part do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
