FactoryBot.define do
  factory :bid do
    user { build(:user) }
    auction { build(:auction) }
  end
end
