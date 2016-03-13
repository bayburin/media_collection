FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "test#{i}@email.com" }
    sequence(:username) { |i| "testuser#{i}" }
    password "12345678"
  end
end
