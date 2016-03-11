FactoryGirl.define do
  factory :item do
    association :collection
    sequence(:description) { |i| "Мой #{i} пункт коллекции" }
    link "http://testlink.ru"
  end
end
