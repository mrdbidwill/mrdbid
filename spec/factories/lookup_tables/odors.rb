FactoryBot.define do
  factory :odor do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
