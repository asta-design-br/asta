require 'rails_helper'

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

    it 'should have a valid email' do
      @user.email = 'wrongemailtest.com'
      expect(@user).to_not be_valid
      expect(@user.errors[:email]).to include('is invalid')
    end

    it 'should have a password' do
      @user.password = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'should have a valid password' do
      @user.password = '12'
      expect(@user).to_not be_valid
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'should have a username' do
      @user.username = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:username]).to include("can't be blank")
    end

    it 'should have a valid username' do
      @user.username = 'Invalid Username'
      expect(@user).to_not be_valid
      expect(@user.errors[:username]).to include('should contain downcase letters and underscore.')
    end

    it 'should have a full_name' do
      @user.full_name = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:full_name]).to include("can't be blank")
    end

    it 'should have a valid full_name' do
      @user.full_name = 'Daniela'
      expect(@user).to_not be_valid
      expect(@user.errors[:full_name]).to include('should contain a name and surname.')
    end

    it 'should have a profile' do
      @user.profile = nil
      expect(@user).to_not be_valid
      expect(@user.errors[:profile]).to include('is too short (minimum is 30 characters)')
    end

    it 'should have a valid profile' do
      @user.profile = 'invalid profile'
      expect(@user).to_not be_valid
      expect(@user.errors[:profile]).to include('is too short (minimum is 30 characters)')
    end

    it 'should have a valid document' do
      @user.document = '12345'
      expect(@user).to_not be_valid
      expect(@user.errors[:document]).to include('should be a CPF or CNPJ valid number.')
    end

  end

  # context 'concerns' do
  #   it_behaves_like 'phonable'
  # end

  # context 'concerns' do
  #   it_behaves_like 'asta_addressable'
  # end
end
