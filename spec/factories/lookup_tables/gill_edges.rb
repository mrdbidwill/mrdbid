FactoryBot.define do
  factory :gill_edge do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
