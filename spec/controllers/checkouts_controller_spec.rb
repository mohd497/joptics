require 'rails_helper'

RSpec.describe CheckoutsController, type: :controller do

  before(:each) do
    sign_in create(:customer)
  end

  describe "new checkout" do
    it "assign a new checkout" do
      get :new
      expect(assigns(:address)).to be_a_new(ShippingAddress)
    end


    it "should render new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "create shipping address" do

    before(:each) do
      @shipping_address = { address: "Test Address", phone_number: 1234567,
                            customer_id: create(:customer).id  }
    end

    it "increase the count of shipping address" do

      expect {
        post :create, shipping_address: @shipping_address
      }.to change(ShippingAddress, :count).by(1)
    end

    it "should redirect" do
      post :create, shipping_address: @shipping_address
      expect(response.status).to eq(302)
    end

  end

  describe "process credit card" do

    it "should redirect to cart" do
      get :process_credit_card
      expect(response.status).to eq(302)
    end

  end

end
