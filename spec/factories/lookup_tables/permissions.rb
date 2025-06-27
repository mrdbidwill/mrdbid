FactoryBot.define do
  factory :permission do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
