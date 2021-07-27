require 'rails_helper'


RSpec.describe User, type: :model do

  describe 'Validations' do
    it "is valid with valid attributes" do
      user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'test@test.com',
        password: '123456789',
        password_confirmation: '123456789')
      expect(user.valid?).to be true
    end

    it "is invalid with invalid password" do
      user = User.new(
        first_name: 'test',
        last_name: 'test',
        email: 'test@test.com',
        password: nil,
        password_confirmation: '123456789')
      expect(user.valid?).to be false
    end

    it "is invalid if the password doesn't match" do
      user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: '123456789',
        password_confirmation: '123456'
      )
      expect(user.valid?).to be false
    end

    it "is invalid if the password is too short" do
      user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: '123',
        password_confirmation: '123'
      )
      expect(user.valid?).to be false
    end


  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should pass with valid credentials' do
      user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: '12345',
        password_confirmation: '12345'
      )
      user.save

      user = User.authenticate_with_credentials('test@test.com', '12345')
      expect(user).not_to be(nil)
    end

    it 'should not pass with invalid credentials' do
      user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: '123456',
        password_confirmation: '123456'
      )
      user.save

      user = User.authenticate_with_credentials('test@test.com', '1234567')
      expect(user).to be(nil)
    end

    it 'should pass even with spaces around the email' do
      user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: '123456',
        password_confirmation: '123456'
      )
      user.save

      user = User.authenticate_with_credentials('  test@test.com  ', '123456')
      expect(user).not_to be(nil)
    end

    it 'should pass even if the email is entered with inconsistent casing' do
      user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('  test@test.COM  ', 'password')
      expect(user).not_to be(nil)
    end

    it 'should not pass if the password is in the incorrect casing' do
      user = User.new(
        first_name: 'first_name',
        last_name: 'last_name',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user.save

      user = User.authenticate_with_credentials('test@test.COM', 'PASSWORD')
      expect(user).to be(nil)
    end

  end

end