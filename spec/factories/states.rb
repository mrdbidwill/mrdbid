FactoryBot.define do
  factory :state do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source

    country { nil }
  end
end
