FactoryBot.define do
  factory :chem_reaction do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
