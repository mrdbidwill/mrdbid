FactoryBot.define do
  factory :camera_make do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
