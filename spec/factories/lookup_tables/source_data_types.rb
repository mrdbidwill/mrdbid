FactoryBot.define do
  factory :source_data_type do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
