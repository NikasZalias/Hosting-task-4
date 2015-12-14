require_relative '../../app/models/hosting'

FactoryGirl.define do
  factory :hosting do
    title 'NikasHosting'
    current_money_count 500_00
    account_number 'LT987654321789456'
  end
  factory :hosting_fake, class: Hosting do
    title 'NikasHosting_fake'
    current_money_count 5
    account_number 'LT159483726963258'
  end
end
