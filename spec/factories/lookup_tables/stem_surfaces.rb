FactoryBot.define do
  factory :stem_surface do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
