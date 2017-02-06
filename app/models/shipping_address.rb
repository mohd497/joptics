class ShippingAddress < ActiveRecord::Base
  belongs_to :customer

  validates :address, :phone_number, presence: true
  validates :phone_number, numericality: true

end
