class ReviewsController < ApplicationController
  def index
    render json: {rating: 4};
  end

  def create
    @product = Product.find(params['product_id'])
    @product.reviews.create({customer_id: current_customer.id, rating: params['rating']})
    render json: {msg: 'success'}
  end
end
