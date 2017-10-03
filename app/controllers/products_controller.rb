class ProductsController < ApplicationController

  before_action :get_current_order_search
  require 'will_paginate/array'

  def index

    if params["sort"] == "asc"
      @q.sorts = "price asc"
    elsif params["sort"] == "dec"
      @q.sorts = "price dec"
    end

    begin
      if params["q"]["category_in"].length == 1
        if params["q"]["category_in"][0] == "men"
          @page_title = """Men's"""
        elsif params["q"]["category_in"][0] == "women"
           @page_title = """Women's"""
        elsif params["q"]["category_in"][0] == "kids"
            @page_title = """Kid's"""
        else
            @page_title = """Any"""
        end
      else
        @page_title = """Any"""
      end
    rescue
      @page_title = """Any"""
    end


    @products = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 12)
    @fav_list = false


    respond_to do |format|
        format.html
        format.json
        format.js { render 'products/paginate' }
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
      flash[:success] = I18n.t("product_created")
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
      flash[:success] = I18n.t("product_edit")
      redirect_to products_path
    else
      flash.now[:alert] = @product.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.presciptions.each do |i|
      i.destroy
    end
    Product.find(params[:id]).destroy
    redirect_to admin_products_path
  end

  def add_to_favorites
    (session[:favorite_products] ||= []) << params[:id]
    render json: {msg: 'successfully added to favorites'}
  end

  def favorites
    @page_title = """Your Wishlist"""
    @fav_list = true
    @products = Product.find(session[:favorite_products] || []).paginate(:page => params[:page], :per_page => 12)
    @q = Product.search(params[:q])
    render :index
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :status, :avatar, :secavatar,
                                    :thirdavatar, :fourthavatar,
                                    :fifthavatar, :sixthavatar,
                                    :seventhavatar, :eighthavatar,
                                    :ninthavatar, :tenthavatar, :itemspec, :category, :subcategory, :newarrivals,
                                    :bestselling, :popularbrand, :brand, :frames, :shapes,
                                    :material, :size, :color, :rx_type)
  end

end
