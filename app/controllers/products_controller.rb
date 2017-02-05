class ProductsController < ApplicationController

  before_action :authenticate_customer!

  def index
    @products = Product.page(params[:page]).per(5).is_enabled
    @order_line = current_order.order_lines.new
    respond_to do |format|
        format.html
        format.json
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_line = current_order.order_lines.new
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
      flash[:success] = "Product created successfully"
      redirect_to products_path
    else
      flash.now[:alert] = @product.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
     @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "Product edited successfully"
      redirect_to products_path
    else
      flash.now[:alert] = @product.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :status)
  end

end
