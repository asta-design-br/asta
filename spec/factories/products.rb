FactoryBot.define do
  factory :product do
    event { nil }
    name { "MyString" }
    description { "MyString" }
    format { "MyString" }
    pixels_height { 1 }
    pixels_width { 1 }
    mm_height { 1 }
    mm_width { 1 }
    milliseconds_length { 1 }
    required_time { 1 }
    category { "MyString" }
  end
end
