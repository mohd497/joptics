require 'rails_helper'

RSpec.describe OrderLinesController, type: :controller do

  before(:each) do
    sign_in FactoryGirl.create(:customer)
    @order_line_params = { qty: 3, unit_price: 1.5, product_id: create(:product).id }
  end

  describe "create order line" do

    it "increase the count of order lines" do
      expect {
        post :create, order_line: @order_line_params
      }.to change(OrderLine, :count).by(1)
    end

    it "should redirect" do
      post :create, order_line: @order_line_params
      expect(response.status).to eq(302)
    end

  end

  describe "update order line" do

    before(:each) do
      @order = FactoryGirl.create(:order)
      @order_line = FactoryGirl.create(:order_line, order: @order)
      request.session[:order_id] = @order.id
      post :update, order_line: @order_line_params, id: @order_line.id
    end

    it "must be equal to updated order line" do
      @order_line.reload
      expect(@order_line.qty).to eq 3
    end

    it "should redirect" do
      expect(response.status).to eq(302)
    end

  end

  describe "delete order line" do

    before(:each) do
      @order = FactoryGirl.create(:order)
      @order_line = FactoryGirl.create(:order_line, order: @order)
    end

    it "decrease the count of order lines" do
      request.session[:order_id] = @order.id
      expect {
      delete :destroy, order_line: @order_line_params, id: @order_line.id
      }.to change(OrderLine, :count).by(-1)
    end

    it "should redirect" do
      request.session[:order_id] = @order.id
      delete :destroy, order_line: @order_line_params, id: @order_line.id
      expect(response.status).to eq(302)
    end

  end

end
