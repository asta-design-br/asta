require 'rails_helper'

RSpec.describe Phone, type: :model do
  context 'validations' do
    before(:each) do
      @phone = build(:phone)
    end

    it 'should be valid with valid attributes' do
      expect(@phone).to be_valid
    end

    it 'should have a phone number' do
      @phone.number = nil
      expect(@phone).to_not be_valid
      expect(@phone.errors[:number]).to include("can't be blank")
    end

    it 'should have a valid phone number' do
      @phone.number = '98556'
      expect(@phone).to_not be_valid
      expect(@phone.errors[:number]).to include('should contain a valid phone number.')
    end

    it 'should have a country code' do
      @phone.country_code = nil
      expect(@phone).to_not be_valid
      expect(@phone.errors[:country_code]).to include("can't be blank")
    end

    it 'should have a valid country code' do
      @phone.country_code = '55'
      expect(@phone).to_not be_valid
      expect(@phone.errors[:country_code]).to include('should contain a valid country code.')
    end

    it 'should have a phonable associated' do
      @phone.phonable = nil
      expect(@phone).to_not be_valid
      expect(@phone.errors[:phonable]).to include("must exist")
    end
  end
end
