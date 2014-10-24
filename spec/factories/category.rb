FactoryGirl.define do

  sequence :veg do |n|
      "Vegetables#{n}"
  end

  factory :category do
    name { generate(:veg) }

    factory :category_with_item do
      after(:create) do |c, _|
        provider = FactoryGirl.create(:provider)
        item = FactoryGirl.create(:item, category_id: c.id, provider_id: provider.id)
      end
    end
  end
end