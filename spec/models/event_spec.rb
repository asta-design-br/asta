require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'validations' do
    before(:each) do
      @event = build(:event)
    end

    it 'should be valid with valid attributes' do
      expect(@event).to be_valid
    end

    it 'should have a event title' do
      @event.title = nil
      expect(@event).to_not be_valid
      expect(@event.errors[:title]).to include("can't be blank")
    end

    it 'should have an event title smaller than 50 chars' do
      @event.title = '*' * 100
      expect(@event).to_not be_valid
      expect(@event.errors[:title]).to include('50 characters is the maximum allowed')
    end

    it 'should have a event description' do
      @event.description = nil
      expect(@event).to_not be_valid
      expect(@event.errors[:description]).to include("can't be blank")
    end

    it 'should have an event description bigger than 50 chars' do
      @event.description = '*' * 40
      expect(@event).to_not be_valid
      expect(@event.errors[:description]).to include('is too short (minimum is 50 characters)')
    end

    it 'should have a start_time after now' do
      @event.start_time = DateTime.now - 1.minute
      expect(@event).to_not be_valid
      expect(@event.errors[:start_time]).to include('can\'t be in the past')
    end

    it 'should have a end_time after start_time' do
      @event.start_time = DateTime.now + 2.day
      @event.end_time = DateTime.now + 1.day
      expect(@event).to_not be_valid
      expect(@event.errors[:end_time]).to include('can\'t be before start time')
    end
  end
end
