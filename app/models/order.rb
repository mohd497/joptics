class Order < ActiveRecord::Base

  has_many :order_lines
  belongs_to :customer

  validates :customer, :order_no, :total, :order_date, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }
end
