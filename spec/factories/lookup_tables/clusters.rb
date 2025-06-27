FactoryBot.define do
  factory :cluster do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
