FactoryBot.define do
  factory :fungus_type do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
