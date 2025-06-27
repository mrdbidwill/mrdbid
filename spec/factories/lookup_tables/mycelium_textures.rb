FactoryBot.define do
  factory :mycelium_texture do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
