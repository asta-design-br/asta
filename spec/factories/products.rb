FactoryBot.define do
  factory :product do
    event { build(:event) }
    name { 'Mussum Flyer' }
    description { 'Mussum Ipsum, cacilds vidis litro abertis.Paisis, filhis, espiritis santis.Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.' }
    product_format { 'printed' }
    pixels_height { 2 }
    pixels_width { 1 }
    mm_height { 0 }
    mm_width { 0 }
    milliseconds_length { 0 }
    required_time { 0 }
    category { 'flyer' }
  end
end
