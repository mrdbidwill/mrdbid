FactoryBot.define do
  factory :stem_shape do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
