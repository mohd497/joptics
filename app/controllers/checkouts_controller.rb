class CheckoutsController < ApplicationController
  require "uri"
  require "net/http"

  def new
    @address = ShippingAddress.new
  end

  def create
    @address = ShippingAddress.new(address_params)
    if @address.save
      @address.order_id = session[:order_id]
      @address.save
      session[:address_id] = @address.id
      redirect_to card_path
    else
      flash.now[:alert] = @address.errors.full_messages.to_sentence
      render :new
    end
  end

  def credit_card_info
    @order = current_order
  end

  def process_credit_card
    uri = URI.parse("http://localhost:3001/api/v1/dummy_gateway")
    response = Net::HTTP.post_form(uri, params)
    data = JSON.parse(response.body).first[1]
    if response.code == "200"
      flash[:success] = data
    else
      flash[:alert] = data
    end
    redirect_to cart_path
  end

  private
  def address_params
    params.require(:shipping_address).permit(:customer_id,:first_name, :last_name, :email, :country, :province, :city,
                                             :address, :postal_code, :phone_number, :shipping_address,:shipping_country,
                                             :shipping_province,:shipping_city,:shipping_postal_code)
  end
end
