require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "is valid when following exist: email, first_name, last_name, 
    password, password_confirmation" do

      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "p@55word",
        password_confirmation: "p@55word"
      })
      user.save
      
      expect(user).to be_valid
    end

    it "is not valid when email already exists" do
      user1 = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "p@55word",
        password_confirmation: "p@55word"
      })
      user1.save
      
      user2 = User.new({
        email: "test@example.com",
        first_name: "Bob2",
        last_name: "Smith2",
        password: "p@55word",
        password_confirmation: "p@55word"
      })
      user2.save

      expect(user2.errors.full_messages).to eq(["Email has already been taken"])

      user2 = User.new({
        email: "TEST@EXAMPLE.COM",
        first_name: "Bob2",
        last_name: "Smith2",
        password: "p@55word",
        password_confirmation: "p@55word"
      })
      user2.save

      expect(user2.errors.full_messages).to eq(["Email has already been taken"])
    end

    it "is not valid when first_name is blank" do 
      user = User.new({
        email: "test@example.com",
        last_name: "Smith",
        password: "p@55word",
        password_confirmation: "p@55word"
      })
      user.save
      
      expect(user.errors.full_messages).to eq(["First name can't be blank"])
    end

    it "is not valid when last is blank" do 
      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        password: "p@55word",
        password_confirmation: "p@55word"
      })
      user.save
      
      expect(user.errors.full_messages).to eq(["Last name can't be blank"])
    end
    
    it "is not valid when password and password_confirmation don't match" do
      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "p@55word",
        password_confirmation: "p@55word1"
      })
      user.save
      
      expect(user.errors.full_messages).to eq(["Password confirmation doesn't match Password"])
    end

    it "is not valid when password missing" do
      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password_confirmation: "p@55word"
      })
      user.save
      
      expect(user.errors.full_messages).to eq(["Password can't be blank",
        "Password is too short (minimum is 8 characters)"])
    end

    it "is not valid when password_confirmation is missing" do
      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "p@55word"
      })
      user.save

      expect(user.errors.full_messages).to eq(["Password confirmation can't be blank"])
    end

  end

  describe ".authenticate_with_credientials" do
    it "returns user with credentials are correct" do
      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "p@55word",
        password_confirmation: "p@55word"
      })
      user.save

      expect(User.authenticate_with_credientials("test@example.com", "p@55word")).to be_instance_of User      
    end

    it "returns nil when email is invalid" do
      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "p@55word",
        password_confirmation: "p@55word"
      })
      user.save

      expect(User.authenticate_with_credientials("test@example.com1", "p@55word")).to eq nil      
    end

    it "returns user even if email entered is padded with spaces" do
      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "p@55word",
        password_confirmation: "p@55word"
      })
      user.save

      expect(User.authenticate_with_credientials("    test@example.com ", "p@55word")).to be_instance_of User
    end

    it "returns user even if email entered is uppercase" do
      user = User.new({
        email: "test@example.com",
        first_name: "Bob",
        last_name: "Smith",
        password: "p@55word",
        password_confirmation: "p@55word"
      })
      user.save

      expect(User.authenticate_with_credientials("    TEST@EXAMPLE.COM ", "p@55word")).to be_instance_of User
    end
  end
end
