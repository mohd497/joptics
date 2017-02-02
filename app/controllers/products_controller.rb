class ProductsController < ApplicationController

  def index
    @products = Product.all
    respond_to do |format|
        format.html
        format.json
    end
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @product }
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:id, :name, :description, :price, :status)
  end

end
