FactoryBot.define do
  factory :rhizomorph_texture do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
