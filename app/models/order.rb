class Order < ActiveRecord::Base

  enum status: [ :cart, :payment, :completed, :cancelled ]

  before_validation :order_no, :order_date, :total

  has_many :order_lines
  belongs_to :customer

  validates :customer, :order_no, :status, :total, :order_date, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }

  def order_no
    self.order_no = SecureRandom.urlsafe_base64(6)
  end

  def order_date
    self.order_date = Date.today
  end

  def total
    order_total = 0
    unless self.order_lines.nil?
      self.order_lines.each do |order_line|
        order_total += order_line.total_price
      end
    end
    self.total = order_total
  end

end
