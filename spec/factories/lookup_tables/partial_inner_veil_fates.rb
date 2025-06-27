FactoryBot.define do
  factory :partial_inner_veil_fate do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
