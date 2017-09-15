class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_order

  def get_current_order_search
    @order = current_order
    @q = Product.search(params[:q])
  end


  def current_order
    if session[:order_id].nil?
      order = Order.create(:status => 'cart')
      order.save
      return order
    else
      Order.find(session[:order_id])
    end
  end

end
