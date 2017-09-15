class OrderLinesController < ApplicationController

  before_action :get_current_order_search

  def create
    @order = current_order
    @order_line = @order.order_lines.new(order_lines_params)
    @order.save
    session[:order_id] = @order.id
    flash[:success] = I18n.t("item_added")
    redirect_to cart_path
  end

  def update
    @order = current_order
    @order_line = @order.order_lines.find(params[:id])
    @order_line.update_attributes(order_lines_params)
    redirect_to request.referer || root_path
  end

  def destroy
    @order = current_order
    @order_line = @order.order_lines.find(params[:id])
    @order_line.destroy
    flash[:success] = I18n.t("item_removed")
    redirect_to request.referer || root_path
  end

  private
  def order_lines_params
    params.require(:order_line).permit(:qty, :unit_price, :prescription_id)
  end

end
