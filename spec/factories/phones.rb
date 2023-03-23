FactoryBot.define do
  factory :phone do
    phonable { build(:user) }
    number { '048 32445697' }
    country_code { '+55' }
  end
end
