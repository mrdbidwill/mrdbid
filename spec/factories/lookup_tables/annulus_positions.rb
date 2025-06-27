FactoryBot.define do
  factory :annulus_position do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
