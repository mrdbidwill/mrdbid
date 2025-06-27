FactoryBot.define do
  factory :cap_context_flesh_texture do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
