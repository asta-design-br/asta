FactoryBot.define do
  factory :product do
    event { build(:event) }
    name { 'Mussum Flyer' }
    description { 'Mussum Ipsum, cacilds vidis litro abertis.Paisis, filhis, espiritis santis.Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.' }
    product_format { 'printed' }
    pixels_height { nil }
    pixels_width { nil }
    mm_height { nil }
    mm_width { nil }
    milliseconds_length { nil }
    required_time { 5 }
    category { 'flyer' }
  end
end
