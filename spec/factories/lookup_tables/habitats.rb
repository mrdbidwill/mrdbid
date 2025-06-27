FactoryBot.define do
  factory :habitat do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
