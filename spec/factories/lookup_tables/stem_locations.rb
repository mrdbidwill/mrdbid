FactoryBot.define do
  factory :stem_location do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
