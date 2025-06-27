FactoryBot.define do
  factory :image_mushroom do
    mushroom_id { nil }
    parts { nil }
    image_name { "MyString" }
    image_file_address { "MyString" }
    image_width { 1 }
    image_height { 1 }
    camera_make { nil }
    camera_model { "MyString" }
    lens { "MyString" }
    exposure { "MyString" }
    aperture { "MyString" }
    iso { "MyString" }
  end
end
