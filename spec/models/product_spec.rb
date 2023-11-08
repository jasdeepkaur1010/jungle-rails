require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      # Example for a valid product
      product = Product.new(
        name: 'Example Product',
        price_cents: 1000, # Assuming the price is in cents
        quantity: 10,
        category: Category.new
      )
      expect(product).to be_valid
    end

    it 'is not valid without a name' do
      # Example for the name validation
      product = Product.new(
        name: nil,
        price_cents: 1000,
        quantity: 10,
        category: Category.new
      )
      expect(product).to_not be_valid
    end

    it 'is not valid without a price' do
      # Example for the price validation
      product = Product.new(
        name: 'Example Product',
        price_cents: nil,
        quantity: 10,
        category: Category.new
      )
      expect(product).to_not be_valid
    end

    it 'is not valid without a quantity' do
      # Example for the quantity validation
      product = Product.new(
        name: 'Example Product',
        price_cents: 1000,
        quantity: nil,
        category: Category.new
      )
      expect(product).to_not be_valid
    end

    it 'is not valid without a category' do
      # Example for the category validation
      product = Product.new(
        name: 'Example Product',
        price_cents: 1000,
        quantity: 10,
        category: nil
      )
      expect(product).to_not be_valid
    end
  end
end
