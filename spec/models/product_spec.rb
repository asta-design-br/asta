require 'rails_helper'

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
      @product.name = 'Mussum Ipsum, cacilds vidis litro abertis. Sapien in monti palavris qui num significa nadis i pareci latim.'
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

    it 'should have a miliseconds length if format is audio or video' do
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

  end
end
