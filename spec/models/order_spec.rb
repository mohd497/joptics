require 'rails_helper'

RSpec.describe Order, type: :model do

  it "should have valid factory" do
    FactoryGirl.build(:order).should be_valid
  end

  it "should have a valid customer id" do
    FactoryGirl.build(:order, :customer_id => "s").should_not be_valid
  end

  it "should require a order_no" do
    FactoryGirl.build(:order, :order_no => "").should_not be_valid
  end

  it "should require total in numerals" do
    FactoryGirl.build(:order, :total => "hundred").should_not be_valid
  end

  it "should require total to be not less then 0" do
    FactoryGirl.build(:order, :total => -1).should_not be_valid
  end

end
