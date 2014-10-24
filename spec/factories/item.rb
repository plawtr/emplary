FactoryGirl.define do

  sequence :asparagus do |n|
      "Asparagus#{n}"
  end

  factory :item do
    name { generate(:asparagus) }
    link "www.ocado.com/asparagus"
    tooltip "Asparagus is good"
    cooking_link "www.bbc.co.uk/asparagus"

  end
end