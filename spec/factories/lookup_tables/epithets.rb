FactoryBot.define do
  factory :epithet do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
