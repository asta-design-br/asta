require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Product, type: :model do
  context 'validations' do
    before(:each) do
      @product = build(:product)
    end

    it 'should be valid with valid attributes' do
      expect(@product).to be_valid
    end

    it 'should have a product name' do
      @product.name = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it 'should have a name smaller than 50 chars' do
      @product.name = 'Mussum Ipsum, cacilds vidis litro abertis.
                      Sapien in monti palavris qui num significa nadis i pareci latim.'
      expect(@product).to_not be_valid
      expect(@product.errors[:name]).to include('%(count) characters is the maximum allowed.')
    end

    it 'should have a product description' do
      @product.description = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:description]).to include('%(count) is too short (minimum is 50 characters).')
    end

    it 'should have a valid product description' do
      @product.description = 'Mussum Ipsum, cacilds vidis litro abertis.'
      expect(@product).to_not be_valid
      expect(@product.errors[:description]).to include('%(count) is too short (minimum is 50 characters).')
    end

    it 'should have a format' do
      @product.product_format = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:product_format]).to include("can't be blank")
    end

    it 'should have a valid format' do
      @product.product_format = 'Mussum'
      expect(@product).to_not be_valid
      expect(@product.errors[:product_format]).to include('%(value) is not a valid format.')
    end

    it 'should have a required_time' do
      @product.required_time = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:required_time]).to include('should be greater than 0.')
    end

    it 'should have a valid required_time' do
      @product.required_time = 0
      expect(@product).to_not be_valid
      expect(@product.errors[:required_time]).to include('should be greater than 0.')
    end

    it 'should have a category' do
      @product.category = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:category]).to include("can't be blank")
    end

    it 'should have a valid category' do
      @product.category = 'Mussum'
      expect(@product).to_not be_valid
      expect(@product.errors[:category]).to include('%(value) is not a valid category.')
    end

    it 'should have miliseconds length if format is audio or video' do
      @product.product_format = 'audio'
      @product.milliseconds_length = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:milliseconds_length]).to include('must exist and be greater than zero.')
    end

    it 'should have a valid miliseconds length if format is audio or video' do
      @product.product_format = 'audio'
      @product.milliseconds_length = 0
      expect(@product).to_not be_valid
      expect(@product.errors[:milliseconds_length]).to include('must exist and be greater than zero.')
    end

    it 'should be valid with only pixels if format is printed or digital' do
      @product.product_format = 'printed'
      @product.pixels_height = 2
      @product.pixels_width = 2
      @product.mm_height = nil
      @product.mm_width = nil
      expect(@product).to be_valid
    end

    it 'should be valid with only milimeters if format is printed or digital' do
      @product.product_format = 'printed'
      @product.pixels_height = nil
      @product.pixels_width = nil
      @product.mm_height = 5
      @product.mm_width = 5
      expect(@product).to be_valid
    end

    it 'should have pixels or milimiters if format is printed or digital' do
      @product.product_format = 'printed'
      @product.pixels_height = nil
      @product.pixels_width = nil
      @product.mm_height = nil
      @product.mm_width = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:pixels_height]).to include('must have or milimeters or pixels dimension.')
    end

    it 'should have pixels width if it has pixels height' do
      @product.product_format = 'printed'
      @product.pixels_height = 2
      @product.pixels_width = nil
      @product.mm_height = nil
      @product.mm_width = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:pixels_width]).to include('must have a positive pixel width value.')
    end

    it 'should have pixels height if it has pixels width' do
      @product.product_format = 'printed'
      @product.pixels_height = nil
      @product.pixels_width = 5
      @product.mm_height = nil
      @product.mm_width = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:pixels_height]).to include('must have a positive pixel height value.')
    end

    it 'should have millimeters width if it has millimeters height' do
      @product.product_format = 'printed'
      @product.pixels_height = nil
      @product.pixels_width = nil
      @product.mm_height = 7
      @product.mm_width = nil
      expect(@product).to_not be_valid
      expect(@product.errors[:mm_width]).to include('must have a positive millimeter width value.')
    end

    it 'should have millimeters height if it has millimeters width' do
      @product.product_format = 'printed'
      @product.pixels_height = nil
      @product.pixels_width = nil
      @product.mm_height = nil
      @product.mm_width = 3
      expect(@product).to_not be_valid
      expect(@product.errors[:mm_height]).to include('must have a positive millimeter height value.')
    end
  end
end
# rubocop:enable Metrics/BlockLength
