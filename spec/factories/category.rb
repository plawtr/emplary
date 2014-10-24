FactoryGirl.define do

  sequence :veg do |n|
      "Vegetables#{n}"
  end

  factory :category do
    name { generate(:veg) }

    factory :category_with_item do
      after(:create) do |c, _|
        item = FactoryGirl.build(:item)
        c.items << item
      end
    end
  end
end