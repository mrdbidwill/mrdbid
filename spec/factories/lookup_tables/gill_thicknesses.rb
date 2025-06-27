FactoryBot.define do
  factory :gill_thickness do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
