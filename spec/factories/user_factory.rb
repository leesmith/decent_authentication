FactoryBot.define do
  factory :user do
    name 'Tom Jones'
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'Password000'
    password_confirmation 'Password000'
    enabled true
  end
end
