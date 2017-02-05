require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  before(:each) do
    sign_in create(:customer)
  end

  describe "show product" do
    before(:each) do
      @product = create(:product)
    end

    it "should render show template" do
      get :show, id: @product
      expect(response).to render_template("show")
    end


    it "should have a product" do
      get :show, id: @product
      expect(assigns(:product)).not_to be_nil
    end

  end

  describe "index product" do

    it "should render index template" do
      get :index
      expect(response).to render_template("index")
    end


    it "should have a products listing" do
      get :index
      expect(assigns(:products)).not_to be_nil
    end
  end

  describe "index product" do

    it "should render index template" do
      get :index
      expect(response).to render_template("index")
    end


    it "should have a products listing" do
      get :index
      expect(assigns(:products)).not_to be_nil
    end
  end

  describe "new product" do
    it "assign a new product" do
      get :new
      expect(assigns(:product)).to be_a_new(Product)
    end


    it "should render new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "edit product" do

    before(:each) do
      @product = create(:product)
    end

    it "assign a edit product" do
      get :edit,   id: @product
      expect(assigns(:product)).to eq(@product)
    end


    it "should render edit template" do
      get :edit,   id: @product
      expect(response).to render_template("edit")
    end
  end

  describe "create product" do

    before(:each) do
      @product = create(:product)
      @product_params = { name: Faker::Name.unique.name, description: "Test description",
                         price: 1.5, status: 1  }
    end

    it "increase the count of order lines" do

      expect {
        post :create, product: @product_params
      }.to change(Product, :count).by(1)
    end

    it "should redirect" do
      post :create, product: @product_params
      expect(response.status).to eq(302)
    end

  end

  describe "update product" do

    before(:each) do
      @product = create(:product)
      @product_params = { name: Faker::Name.unique.name, description: "Test description",
                         price: 12.2, status: 1  }
    end

    it "must be equal to updated order line" do
      post :update, product: @product_params, id: @product.id
      @product.reload
      expect(@product.price).to eq 12.2
    end

    it "should redirect" do
      post :update, product: @product_params, id: @product.id
      expect(response.status).to eq(302)
    end

  end

end
