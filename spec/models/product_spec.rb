require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it "valid when no field is empty?" do
      @categ = Category.new
      @categ.name = "Toys"
      @categ.save
      @product = Product.new
      @product.name = 'Fan'
      @product.description = "xyz"
      @product.price_cents = 300
      @product.quantity = 5
      @product.category = @categ
      @product.save
      expect(@product.errors).to be_empty
    end

      it "invalid without a name" do
        @categ = Category.new
        @categ.name = "Toys"
        @categ.save
        @product = Product.new
        @product.name = nil
        @product.category = @categ
        @product.description = "xyz"
        @product.price_cents = 200
        @product.quantity = 10
        @product.save
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end

      it "invalid without a price" do
        @categ = Category.new
        @categ.name = "Toys"
        @categ.save
        @product = Product.new
        @product.name = "Hot Wheels"
        @product.description = "xyz"
        @product.category = @categ
        @product.price_cents = nil
        @product.quantity = 10
        @product.save
        expect(@product.errors.full_messages).to include "Price is not a number"
      end

      it "invalid without a quantity" do
        @categ = Category.new
        @categ.name = "Toys"
        @categ.save
        @product = Product.new
        @product.name = "Hot Wheels"
        @product.description = "xyz"
        @product.category = @categ
        @product.price_cents = 50
        @product.quantity = nil
        @product.save
        expect(@product.errors.full_messages).to include "Quantity can't be blank"
      end

      it "invalid without a category" do
        @categ = Category.new
        @categ.name = "Toys"
        @categ.save
        @product = Product.new
        @product.name = "Hot Wheels"
        @product.description = "xyz"
        @product.category = nil
        @product.price_cents = 50
        @product.quantity = 8
        @product.save
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end

end
end
