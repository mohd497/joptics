FactoryGirl.define do
  factory :product do
    description "MyProduct"
    name { Faker::Name.unique.name }
    price 1.5
    status true
  end
end
