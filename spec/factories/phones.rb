FactoryBot.define do
  factory :phone do
    phonable { nil }
    number { "MyString" }
    country_code { "MyString" }
  end
end
