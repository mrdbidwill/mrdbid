FactoryBot.define do
  factory :universal_outer_veil_appearance do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
