FactoryGirl.define do
  factory :order_line do
    order_id 1
    product_id 1
    qty 1
    unit_price 1.5
    total_price "MyString"
    float "MyString"
  end
end
