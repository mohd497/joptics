class CartsController < ApplicationController

  def show
    @order = current_order
    respond_to do |format|
      format.html
      format.json { render json: @order }
    end
  end

  def index
    @order_list = current_customer.orders
                      .order(order_date: :desc).page(params[:page]).per(5)
  end

end
