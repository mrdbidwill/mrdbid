FactoryBot.define do
  factory :article do
    title { "MyString" }
    author { "MyString" }
    ref { "MyString" }
    item_code { "MyString" }
    comment { "MyText" }
    my_rating { 1 }
    my_comment { "MyText" }
  end
end
