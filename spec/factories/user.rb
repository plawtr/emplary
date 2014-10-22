FactoryGirl.define do

  sequence :last_name do |n|
      "Smith#{n}"
  end

  factory :user do
    first_name "John"
    last_name
    admin false
    email "test@mailinator.com"
    password "password"
    password_confirmation "password"
    confirmed_at Time.now
    unconfirmed_email nil

    factory :admin do
      admin true
    end

    trait :unconfirmed do 
      confirmed_at nil 
    end

  end

end