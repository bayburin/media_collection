FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "test#{i}@email.com" }
    password "12345678"
    collection
  end
end
