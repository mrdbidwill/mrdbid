FactoryBot.define do
  factory :gill_spacing do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
