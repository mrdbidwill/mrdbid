FactoryBot.define do
  factory :abundance, class: "LookupTables::Abundance" do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
