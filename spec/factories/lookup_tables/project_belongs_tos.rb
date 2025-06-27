FactoryBot.define do
  factory :project_belongs_to do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
