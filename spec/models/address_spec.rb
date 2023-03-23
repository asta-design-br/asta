require 'rails_helper'

RSpec.describe Address, type: :model do
  context 'validations' do
    before(:each) do
      @address = build(:address)
    end

    it 'should be valid with valid attributes' do
      expect(@address).to be_valid
    end

    it 'should have a street' do
      @address.street = nil
      expect(@address).to_not be_valid
      expect(@address.errors[:street]).to include("can't be blank")
    end

    it 'should have a number' do
      @address.number = nil
      expect(@address).to_not be_valid
      expect(@address.errors[:number]).to include("can't be blank")
    end

    it 'should have a neighborhood' do
      @address.neighborhood = nil
      expect(@address).to_not be_valid
      expect(@address.errors[:neighborhood]).to include("can't be blank")
    end

    it 'should have a city' do
      @address.city = nil
      expect(@address).to_not be_valid
      expect(@address.errors[:city]).to include("can't be blank")
    end

    it 'should have a state' do
      @address.state = nil
      expect(@address).to_not be_valid
      expect(@address.errors[:state]).to include("can't be blank")
    end

    it 'should have an addressable associated' do
      @address.asta_addressable = nil
      expect(@address).to_not be_valid
      expect(@address.errors[:asta_addressable]).to include("must exist")
    end
  end
end
