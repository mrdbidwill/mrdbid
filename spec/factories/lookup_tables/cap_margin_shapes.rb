FactoryBot.define do
  factory :cap_margin_shape do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
