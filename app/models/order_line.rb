class OrderLine < ActiveRecord::Base

  belongs_to :product
  belongs_to :order

  validates :product, :order, :qty, :unit_price, :total_price, presence: true
  validates :qty, numericality: { greater_than_or_equal_to: 1 }
  validates :unit_price, numericality: { greater_than_or_equal_to: 1.0 }

  def total_price
     qty * unit_price
  end

end
