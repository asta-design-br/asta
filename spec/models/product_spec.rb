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
      expect(@product.errors[:name]).to include('50 characters is the maximum allowed.')
    end

    it 'should have a product description bigger than 50 chars' do
      @product.description = 'Mussum Ipsum, cacilds vidis litro abertis.'
      expect(@product).to_not be_valid
      expect(@product.errors[:description]).to include('this is too short (minimum is 50 characters)')
    end

    it 'should have valid format' do
      @product.product_format = 'Mussum'
      expect(@product).to_not be_valid
      expect(@product.errors[:product_format]).to include('this is not a valid format.')
    end
  end
end
