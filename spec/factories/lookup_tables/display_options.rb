FactoryBot.define do
  factory :display_option do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
