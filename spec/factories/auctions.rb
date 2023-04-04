FactoryBot.define do
  factory :auction do
    product { build(:product) }
    deadline { DateTime.now + 1.hour }
    open { false }
  end
end
