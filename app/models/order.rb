class Order < ActiveRecord::Base



  enum status: [ :cart, :payment, :completed, :cancelled ]

  scope :done_order, -> { where(:status => 1) }

  before_create :order_no, :order_date

  has_many :presciptions
  has_one :shipping_address

  def order_no
    self.order_no = rand(4 ** 5)
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
    self.total = order_total.round(2).to_f
  end

end
