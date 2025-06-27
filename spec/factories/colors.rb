FactoryBot.define do
  factory :color do
    latin_name { "MyString" }
    common_name { "MyString" }
    color_group { 1 }
    hex { "MyString" }
    sequence_number { 1 }
    r_val { 1 }
    g_val { 1 }
    b_val { 1 }
    closest_websafe_color { "MyString" }
    cwc_r { 1 }
    cwc_g { 1 }
    cwc_b { 1 }
    image_file { "MyString" }
  end
end
