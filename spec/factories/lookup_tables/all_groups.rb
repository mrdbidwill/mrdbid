FactoryBot.define do
  factory :all_group do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
