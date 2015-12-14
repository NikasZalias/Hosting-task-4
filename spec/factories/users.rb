require_relative '../../app/models/user'

FactoryGirl.define do
  factory :user do
    name 'Nikas'
    surname 'Zalias'
    address 'Giedros 7'
    number 863_330_226
    account_number 'LT123456789987654'
    password 'nikas.12.pass'
    blocked false
    status 3
    domains_name 'www.nikas.lt'
    email 'nzaliauskas@gmail.com'
    person_type 'Person'
    company_name 'Google'
    country 'Lithuania'
    current_money_count 500
    domain_count 1
    server 'Simple'
  end
  factory :user_fake, class: User do
    name 'Nikas_fake'
    surname 'Zalias_fake'
    address 'Giedros 7_fake'
    number 863_330_227
    account_number 'LT12345678632122'
    password 'nikas.12.pass_fake'
    blocked true
    status 3
    domains_name ''
    email 'nzaliauskas@gmail.cuk'
    person_type 'Company'
    company_name 'Gooogle'
    country 'Latvia'
    current_money_count 50
    domain_count 0
    server 'Simple_fake'
  end
end
