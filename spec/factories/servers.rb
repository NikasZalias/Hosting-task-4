require_relative '../../app/models/server'

FactoryGirl.define do
  factory :server_one, class: Server do
    name 'Simple'
    price 15
  end
  factory :server_two, class: Server do
    name 'Medium'
    price 30
  end
  factory :server_three, class: Server do
    name 'Extra'
    price 50
  end
end
