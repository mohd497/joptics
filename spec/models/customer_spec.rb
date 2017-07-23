require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "should have valid factory" do
    build(:customer).should be_valid
  end

  it "should require a first_name" do
    build(:customer, :first_name => "").should_not be_valid
  end

  it "should require a last_name" do
    build(:customer, :last_name => "").should_not be_valid
  end

  it "should require email" do
    build(:customer, :email => "").should_not be_valid
  end

  it "should require email formatted" do
    build(:customer, :email => "test_email").should_not be_valid
  end

  it "should require password" do
    build(:customer, :password => "").should_not be_valid
  end

  it "should require password and confirm_password to be same" do
    build(:customer, :password => "test_password",
                      :password_confirmation => "wrong_password").should_not be_valid
  end

  it "should require password to be minimum 7 characters" do
    build(:customer, :password => "test").should_not be_valid
  end
end
