class Order < ActiveRecord::Base

  enum status: [ :cart, :payment, :completed, :cancelled ]

  before_validation :order_no, :order_date
  has_many :presciptions
  has_one :shipping_address

  def order_no
    self.order_no = SecureRandom.urlsafe_base64(6)
  end

  def order_date
    self.order_date = Date.today
  end

  def total
    order_total = 0
    unless self.presciptions.nil?
      self.presciptions.each do |order_line|
        order_total += order_line.total_cost
      end
    end
    self.total = order_total.round(2)
  end

end
