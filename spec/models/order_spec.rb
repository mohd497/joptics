require 'rails_helper'

RSpec.describe Order, type: :model do

  it "should have valid factory" do
    build(:order).should be_valid
  end

  it "should have a valid customer id" do
    build(:order, :customer_id => "s").should_not be_valid
  end

  it "it should return 0 total if no order lines present" do
    order = build(:order)
    order.total.should == 0
  end
end
