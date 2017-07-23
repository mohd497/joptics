require 'net/http'

module OpenWeatherMap
	def process_payment
		uri = URI(ENV['payment_gateway_host'])

		res = Net::HTTP.post_form(
			uri, 
			'login' => ENV['payment_gateway_username'],
			'password' => ENV['payment_gateway_password'],
			'amount' => @order.total,
			'card_number' => '4012888818888',
			'expiration' => '03/21',
			'csv' => '123'
		)
		res.body.to_sym
	end
end