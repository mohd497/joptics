FactoryGirl.define do
  factory :order do
    order_no 12467
    customer { FactoryGirl.create(:customer) }
    total 1000
    order_date "2017-02-02"
  end
end
