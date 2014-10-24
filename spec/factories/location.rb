FactoryGirl.define do


  factory :location do
    street_address  nil
    sub_premise nil
    street_number nil
    street_name nil
    city "London"
    state nil
    state_code nil
    state_name nil
    zip "EC2A 3PT"
    country_code "GB"
    province nil
    precision "city"
    full_address "London EC2A 3PT, UK"
    lat {51.52399279999999 }
    lng {-0.0806547 }
    provider "google"
    district "Greater London"
    country "United Kingdom"
    accuracy 4
    swlng -0.08200578029150203
    swlat 51.5225622697085
    nelng -0.07930781970849796
    nelat 51.5252602302915

  end
end
