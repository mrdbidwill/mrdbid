FactoryBot.define do
  factory :cap_surface_texture do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
