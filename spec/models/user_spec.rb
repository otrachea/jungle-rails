require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is valid when following exist: email, first_name, last_name, 
    password, password_confirmation" do

      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "abc123",
        password_confirmation: "abc123"
      })
      user.save
      
      expect(user).to be_valid
    end

    it "is not valid when email already exists" do
      user1 = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "abc123",
        password_confirmation: "abc123"
      })
      user1.save
      
      user2 = User.new({
        email: "test@example.com",
        first_name: "Bob2",
        last_name: "Smith2",
        password: "abc123",
        password_confirmation: "abc123"
      })
      user2.save

      expect(user2.errors.full_messages).to eq(["Email has already been taken"])

      user2 = User.new({
        email: "TEST@EXAMPLE.COM",
        first_name: "Bob2",
        last_name: "Smith2",
        password: "abc123",
        password_confirmation: "abc123"
      })
      user2.save

      expect(user2.errors.full_messages).to eq(["Email has already been taken"])
    end

    it "is not valid when first_name is blank" do 
      user = User.new({
        email: "test@example.com",
        last_name: "Smith",
        password: "abc123",
        password_confirmation: "abc123"
      })
      user.save
      
      expect(user.errors.full_messages).to eq(["First name can't be blank"])
    end

    it "is not valid when last is blank" do 
      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        password: "abc123",
        password_confirmation: "abc123"
      })
      user.save
      
      expect(user.errors.full_messages).to eq(["Last name can't be blank"])
    end
    
    it "is not valid when password and password_confirmation don't match" do

      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "123abc",
        password_confirmation: "abc123"
      })
      user.save
      
      expect(user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
    end

    it "is not valid when password missing" do

      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password_confirmation: "abc123"
      })
      user.save
      
      expect(user.errors.full_messages).to eq(["Password can't be blank"])
    end

    it "is not valid when password_confirmation is missing" do

      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "123abc",
      })
      user.save
      puts user.inspect
      expect(user.errors.full_messages).to eq(["Password confirmation can't be blank"])
    end

  end
end
