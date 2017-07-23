require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe "show cart" do

    before(:each) do
      sign_in create(:customer)
    end

    it "should render show template" do
      get :show
      expect(response).to render_template("show")
    end

    it "should have an order" do
      get :show
      expect(assigns(:order)).not_to be_nil
    end

  end
end
