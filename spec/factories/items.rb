FactoryGirl.define do
  factory :item do
    user
    sequence(:description) { |i| "Мой #{i} пункт коллекции" }
    link "http://testlink.ru"
  end

  factory :invalid_item, parent: :item do
    user
    description ""
    link "http://testlink.ru"
  end
end
