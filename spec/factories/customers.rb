FactoryGirl.define do
  factory :customer do
    email "test@test.com"
    password "crossover_test"
    password_confirmation "crossover_test"
    first_name "testfirst"
    last_name "testlast"
  end
end
