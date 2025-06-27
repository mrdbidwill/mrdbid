FactoryBot.define do
  factory :partial_inner_veil_appearance do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
