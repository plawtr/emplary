FactoryGirl.define do

  sequence :last_name do |n|
      "Smith#{n}"
  end

  factory :user do
    first_name "John"
    last_name
    admin false
    email
    password "password"
    password_confirmation "password"

    factory :admin do
        admin true
    end
    
  end

end