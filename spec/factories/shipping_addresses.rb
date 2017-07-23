FactoryGirl.define do
  factory :shipping_address do
    address "MyString"
    phone_number "192456789"
    customer_id { FactoryGirl.create(:customer) }
  end
end
