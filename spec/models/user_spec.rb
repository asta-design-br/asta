require 'rails_helper'
require Rails.root.join 'spec/support/concerns/phonable_examples.rb'

RSpec.describe User, type: :model do
  context 'validations' do
    before(:each) do
      @user = build(:user)
    end

    it 'should be valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'should have an email' do
      @user.email = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'should have a password' do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'should have a username' do
      @user.username = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:username]).to include("can't be blank")
    end

    it 'should have a full_name' do
      @user.full_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:full_name]).to include("can't be blank")
    end

    it 'should have a profile' do
      @user.profile = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:profile]).to include('is too short (minimum is 30 characters)')
    end
  end

  context 'concerns' do
    it_behaves_like 'phonable'
  end
end
