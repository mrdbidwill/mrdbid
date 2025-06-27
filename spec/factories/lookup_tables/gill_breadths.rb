FactoryBot.define do
  factory :gill_breadth do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
