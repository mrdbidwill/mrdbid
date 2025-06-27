FactoryBot.define do
  factory :cap_margin_type do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
