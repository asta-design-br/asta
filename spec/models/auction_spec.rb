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
      expect(@auction.errors[:product]).to include('must exist')
    end

    it 'should have an existing deadline' do
      @auction.deadline = nil
      expect(@auction).to_not be_valid
      expect(@auction.errors[:deadline]).to include('can\'t be blank')
    end

    it 'should have a valid deadline' do
      @auction.deadline = DateTime.now - 1.day
      expect(@auction).to_not be_valid
      expect(@auction.errors[:deadline]).to include('must be after now and before event start time')
    end

    it 'should have a valid deadline' do
      @auction.deadline = @auction.product.event.start_time + 1.second
      expect(@auction).to_not be_valid
      expect(@auction.errors[:deadline]).to include('must be after now and before event start time')
    end
  end
end
