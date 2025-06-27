FactoryBot.define do
  factory :camera_model do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
