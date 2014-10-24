FactoryGirl.define do

  sequence :source_name do |n|
      "Online groceries#{n}"
  end

  factory :source do
    name { generate(:source_name) }

    factory :source_with_dependents do
      after(:build) do |s, _|

        provider = FactoryGirl.create(:provider_with_dependents)
        s.providers << provider
      end
    end
  end
end