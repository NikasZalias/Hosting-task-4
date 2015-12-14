require_relative '../../app/models/admin'

FactoryGirl.define do
  factory :admin do
    name 'admin'
    password 'admin.123'
    status 2
    hosting
  end
  factory :admin_fake, class: Admin do
    name 'admin_fake'
    password 'admin.12.fake'
    status 3
  end
end
