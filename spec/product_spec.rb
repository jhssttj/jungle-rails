require 'rails_helper'
RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should confirm its a valid product' do
      @product = Product.new
      @category = Category.new
      @category.name = 'Grass'
      @product.name = 'Farmgrass' 
      @product.price_cents = 1
      @product.quantity = 30000
      @product.category = @category
      expect(@product.valid?).to be true
    end

    it "check name is valid" do
      @product = Product.new
      @product.name = nil 
      @product.valid?
        expect(@product.errors[:name]).to include("can't be blank")
  
      @product.name = 'Farmgrass' 
      @product.valid? 
        expect(@product.errors[:name]).not_to include("can't be blank")
    end

    it "check price is valid" do
      @product = Product.new
      @product.price_cents = nil 
      @product.valid?
        expect(@product.errors[:price_cents]).to include("is not a number")
  
      @product.price_cents = 1 
      @product.valid? 
        expect(@product.errors[:price_cents]).not_to include("is not a number")
    end

    it "check quantity is valid" do
      @product = Product.new
      @product.quantity = nil 
      @product.valid?
        expect(@product.errors[:quantity]).to include("can't be blank")
  
      @product.quantity = 1 
      @product.valid? 
        expect(@product.errors[:quantity]).not_to include("can't be blank")
    end

    it "check category is valid" do
      @product = Product.new
      @product.category = nil
      @product.valid?
        expect(@product.errors[:category]).to include("must exist")
  
      @product.category = Category.new
      @product.valid? 
        expect(@product.errors[:category]).not_to include("must exist")
    end
  end
end