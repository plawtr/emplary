FactoryGirl.define do

  sequence :store do |n|
      "Ocado#{n}"
  end

  sequence :website do |n|
      "www#{n}.testsite.com"
  end

  factory :provider do
    name { generate(:store) }
    website { generate(:website) }

    factory :provider_with_dependents do
      after(:create) do |p, _|

        location = FactoryGirl.create :location 
        category = FactoryGirl.create :category
        item = FactoryGirl.create(:item, category_id: category.id, provider_id: p.id)
        p.locations << location
        p.categories << category
      end
    end
  end
end