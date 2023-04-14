FactoryBot.define do
  factory :user do
    sequence :email do |n| # every time n begins at 0
      "test#{n}@example.com"
    end
    password { 'test@123' }
    first_name { 'Robert' }
    last_name { 'Rea' }
    confirmed_at { DateTime.now }
  end
end
