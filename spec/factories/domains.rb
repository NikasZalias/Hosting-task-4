require_relative '../../app/models/domain'

FactoryGirl.define do
  factory :domain_one, class: Domain do
    name 'www.domain_one.lt'
    price 10
  end
  factory :domain_two, class: Domain do
    name 'www.domain_two.lt'
    price 10
  end
  factory :domain_three, class: Domain do
    name 'www.domain_three.lt'
    price 10
  end
  factory :domain_four, class: Domain do
    name 'www.domain_four.lt'
    price 10
  end
  factory :domain_five, class: Domain do
    name 'www.domain_five.lt'
    price 10
  end
end
