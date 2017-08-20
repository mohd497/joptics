class Review < ActiveRecord::Base
  belongs_to :product
  validates_uniqueness_of :product_id, scope: :customer_id, message: 'you cannot rate the same product twice'

  def self.average_rating(product_id)
    Review.where(product_id: product_id).average('rating')
  end
end
