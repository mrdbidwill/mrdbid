FactoryBot.define do
  factory :bulb_type do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
