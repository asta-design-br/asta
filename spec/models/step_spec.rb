require 'rails_helper'

RSpec.describe Step, type: :model do
  context 'validations' do
    before(:each) do
      @step = build(:step)
    end

    after(:all) do
      Step.destroy_all
      Auction.destroy_all
      Product.destroy_all
      User.destroy_all
    end

    it 'should be valid with valid parameters.' do
      expect(@step).to be_valid
    end

    it 'should have a title shorter than 50 chars.' do
      @step.title = nil
      expect(@step).to_not be_valid
      expect(@step.errors[:title]).to include('can\'t be blank')

      @step.title = '*' * 55
      expect(@step).to_not be_valid
      expect(@step.errors[:title]).to include('is too long (maximum is 50 characters)')
    end

    it 'should have a note greater than 50 chars.' do
      @step.notes = '*' * 45
      expect(@step).to_not be_valid
      expect(@step.errors[:notes]).to include('is too short (minimum is 50 characters)')
    end

    it 'should have a due_date.' do
      @step.due_date = nil
      expect(@step).to_not be_valid
      expect(@step.errors[:due_date]).to include('can\'t be blank')
    end

    it 'should have a sequence_id.' do
      @step.sequence_id = nil
      expect(@step).to_not be_valid
      expect(@step.errors[:sequence_id]).to include('can\'t be blank')
    end

    it 'should be sequential.' do
      @step.bid.auction.product.event.user.save
      @step.bid.auction.product.event.save
      @step.bid.auction.product.save
      @step.bid.auction.save
      @step.bid.user = build(:user)
      @step.bid.user.email = "#{DateTime.now.second}@email.com"
      @step.bid.user.save
      @step.bid.save
      @step.save
      step2 = build(:step)
      step2.bid = @step.bid
      step2.sequence_id = 0
      expect(step2).to_not be_valid
      expect(step2.errors[:sequence_id]).to include('steps must be sequentials')
      step2.sequence_id = 1
      step2.due_date = @step.due_date
      expect(step2).to_not be_valid
      expect(step2.errors[:due_date]).to include('the due date must be after the due date of the step that came before')
    end
  end
end
