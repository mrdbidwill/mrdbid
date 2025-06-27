FactoryBot.define do
  factory :camera do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    camera_makes { nil }
    camera_models { nil }
    lens { nil }
  end
end
