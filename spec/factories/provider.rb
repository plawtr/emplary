FactoryGirl.define do

  sequence :store do |n|
      "Ocado#{n}"
  end

  factory :provider do
    name { generate(:store) }
    website { generate(:store) }

    factory :provider_with_dependents do
      after(:build) do |p, _|

        location = FactoryGirl.create(:location)
        category = FactoryGirl.create :category_with_item

        p.locations << location
        p.categories << category
      end
    end
  end
end