FactoryGirl.define do
  factory :collection do
    user
    trait :with_item do
      items { [create(:item)] }
    end

    trait :with_items do
      items { 3.times.map{ create(:item) } }
    end
  end

  # create(:collection, :with_items)
end
