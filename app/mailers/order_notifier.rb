class OrderNotifier < ApplicationMailer
  default :from => 'ajmtraders123@gmail.com'

  def send_order_email(order)
    @rder = order
    mail( :to => 'ajmtraders123@gmail.com',
          :subject => 'Thanks for signing up for our amazing app' )
  end




end
