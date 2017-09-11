class ReviewsController < ApplicationController
  before_action :authenticate_customer!, only: [:create]

  def index
    render json: {rating: Review.average_rating(params['product_id'])}
  end

  def create
    @product = Product.find(params['product_id'])
    @review = Review.create({customer_id: current_customer.id,
      rating: params['rating'],
      product_id: @product.id})
    if @review.valid?
      render json: @review
    else
      render json: @review.errors.messages[:product_id], status: :unprocessable_entity
    end
  end
end
