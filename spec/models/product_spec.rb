require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do

    before do
      @category = Category.new({name: "Test Category"})
    end
    
    it "is valid with valid attributes" do

      product = Product.new({
        name: "Name",
        price: 100,
        quantity: 0, 
        category: @category
      })
      product.save
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      product = Product.new({
        name: nil,
        price: 100,
        quantity: 0, 
        category: @category
      })
      product.save
      expect(product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it "is not valid without a price" do
      product = Product.new({
        name: "Name",
        quantity: 0, 
        category: @category
      })
      product.save
      expect(product.errors.full_messages).to eq(["Price cents is not a number", 
        "Price is not a number", "Price can't be blank"]
      )
    end
    
    it "is not valid without a quantity" do
      product = Product.new({
        name: "Name",
        price: 100,
        quantity: nil, 
        category: @category
      })
      product.save
      expect(product.errors.full_messages).to eq(["Quantity can't be blank"])
    end

    it "is not valid without a category" do
      product = Product.new({
        name: "Name",
        price: 100,
        quantity: 0, 
        category: nil
      })
      product.save
      expect(product.errors.full_messages).to eq(["Category must exist", 
        "Category can't be blank"])
    end
  end
end
