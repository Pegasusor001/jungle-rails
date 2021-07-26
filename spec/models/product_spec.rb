require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "is valid with valid attributes" do
      product = Product.new
      category = Category.new
      category.name = 'Category'
      product.name = 'Product'
      product.price_cents = 1
      product.quantity = 1
      product.category = category
      expect(product.valid?).to be true
    end
    it "is not valid without a name" do
      product = Product.new
      category = Category.new
      category.name = 'Category'
      product.name = nil
      product.price_cents = 1
      product.quantity = 1
      product.category = category
      expect(product.valid?).to be false
    end
    it "is not valid without a price" do
      product = Product.new
      category = Category.new
      category.name = 'Category'
      product.name = 'Product'
      product.price_cents = nil
      product.quantity = 1
      product.category = category
      expect(product.valid?).to be false
    end
    it "is not valid without a quantity" do
      product = Product.new
      category = Category.new
      category.name = 'Category'
      product.name = 'Product'
      product.price_cents = 1
      product.quantity = nil
      product.category = category
      expect(product.valid?).to be false
    end
    it "is not valid without a category" do
      product = Product.new
      category = Category.new
      category.name = 'Category'
      product.name = 'Product'
      product.price_cents = 1
      product.quantity = 1
      product.category = nil
      expect(product.valid?).to be false
    end 
  end
end