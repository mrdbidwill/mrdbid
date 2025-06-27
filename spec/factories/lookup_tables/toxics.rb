FactoryBot.define do
  factory :toxic do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
