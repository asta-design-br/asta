FactoryBot.define do
  factory :product do
    event { build(:event) }
    name { 'Mussum Flyer' }
    description do
      'Mussum Ipsum, cacilds vidis litro abertis.Paisis, filhis, espiritis santis.
      Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.'
    end
    product_format { 'audio' }
    pixels_height { nil }
    pixels_width { nil }
    mm_height { nil }
    mm_width { nil }
    milliseconds_length { 2 }
    required_time { 5 }
    category { 'audio' }
  end
end
