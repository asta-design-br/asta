require 'rails_helper'

RSpec.describe Bid, type: :model do
  context 'validations' do
    before(:each) do
      @bid = build(:bid)
    end

    it 'should be valid with valid attributes' do
      expect(@bid).to be_valid
    end

    it 'should have a user' do
      @bid.user = nil
      expect(@bid).to_not be_valid
      expect(@bid.errors[:user]).to include('must exist')
    end

    it 'should have a valid user' do
      role = Role.create!(name: 'producer')
      user = build(:user)
      user.roles << role
      user.save
      @bid.user = user
      expect(@bid).to_not be_valid
      expect(@bid.errors[:user]).to include('must be a talent')
    end

    it 'should have an auction' do
      @bid.auction = nil
      expect(@bid).to_not be_valid
      expect(@bid.errors[:auction]).to include('must exist')
    end
  end
end
