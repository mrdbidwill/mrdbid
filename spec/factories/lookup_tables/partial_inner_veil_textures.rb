FactoryBot.define do
  factory :partial_inner_veil_texture do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
