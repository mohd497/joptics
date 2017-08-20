class ReviewsController < ApplicationController
  def index
    render json: {rating: 4};
  end
end
