require 'rails_helper'

RSpec.describe Auction, type: :model do
  context 'validations' do
    before(:each) do
      @auction = build(:auction)
    end

    it 'should be valid with valid attributes' do
      expect(@auction).to be_valid
    end

    it 'should have a valid product' do
      @auction.product = nil
      expect(@auction).to_not be_valid
      expect(@auction.errors[:product]).to include('must be after now and before start time')
    end

    it 'should have a valid deadline' do
      @auction.deadline = nil
      expect(@auction).to_not be_valid
      expect(@auction.errors[:deadline]).to include('must be after now and before start time')
    end
  end
end
