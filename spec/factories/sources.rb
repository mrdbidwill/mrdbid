FactoryBot.define do
  factory :source do
    title { "Source Title" }
    author { "Source Author" }
    ref { "Source Ref" }
    item_code { "Source Item Code" }
    comment { "Source Comment" }
    my_rating { 5 }
    my_comment { "Source My Comment" }
  end
end
