require 'rails_helper'

RSpec.describe ShippingAddress, type: :model do
  it "should have valid factory" do
    build(:shipping_address).should be_valid
  end

  it "should require an address" do
    build(:shipping_address, :address => "").should_not be_valid
  end

  it "should require a phone_number" do
    build(:shipping_address, :phone_number => "").should_not be_valid
  end

  it "should require phone_number in numerals" do
    build(:shipping_address, :phone_number => "hundred").should_not be_valid
  end
end
