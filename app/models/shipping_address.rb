class ShippingAddress < ActiveRecord::Base
  belongs_to :customer
  belongs_to :order

end
