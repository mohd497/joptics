require 'rails_helper'

RSpec.describe Product, type: :model do

  it "should have valid factory" do
    build(:product).should be_valid
  end

  it "should require a product name" do
    build(:product, :name => "").should_not be_valid
  end

  it "should require a product description" do
    build(:product, :description => "").should_not be_valid
  end

  it "should require price in numerals" do
    build(:product, :price => "hundred").should_not be_valid
  end

  it "should require price to be greater then 0" do
    build(:product, :price => 0).should_not be_valid
  end

  it "should require status to be true or false" do
    product = build(:product)
    expect(product.status).to be_in([true, false])
  end
end
