FactoryBot.define do
  factory :cap_shape_top_view do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
