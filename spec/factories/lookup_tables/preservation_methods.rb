FactoryBot.define do
  factory :preservation_method do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
