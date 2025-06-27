FactoryBot.define do
  factory :stem_interior do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
