FactoryBot.define do
  factory :gill_context_flesh_latex_abundance do
    name { "MyString" }
    description { "MyText" }
    comments { "MyText" }
    association :source
  end
end
