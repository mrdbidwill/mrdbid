FactoryBot.define do
  factory :gill_attachment do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
