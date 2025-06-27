FactoryBot.define do
  factory :country do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
