FactoryBot.define do
  factory :step do
    bid { build(:bid) }
    sequence_id { 0 }
    title { "First deliver" }
    notes { '*' * 55 }
    price_cents { 1 }
    due_date { DateTime.now + 12.hour }
    approved { false }
  end
end
