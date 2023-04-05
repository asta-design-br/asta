FactoryBot.define do
  factory :event do
    user { build(:user) }
    title { 'Example' }
    description { 'This is an example of description and must be longer than the words I have written before' }
    start_time { DateTime.now + 1.week }
    end_time { DateTime.now + 2.week }
  end
end
