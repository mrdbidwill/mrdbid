FactoryBot.define do
  factory :habit do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
