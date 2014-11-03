Feature: Getting location based results
  As a user on the platform I enter my zipcode and receive results based on prximity to my location

  Background:
    Given I visit the homepage
    And a source with provider, category and item exists

  Scenario Outline: postcode within 50 miles of the provider
    When with a cassette named "location_based_within_50_miles_lookup_from_google_cassette" I provide <postcode> as a zipcode
    Then I should see provider, source, category, and item

    Examples:
      | postcode   | 
      |  "EC2A3PT" |  
      |  "EC2A3 PT"| 
      |  "E84dg "  | 
      |  "sw1E 2jl"| 
       # last one is partially correct but resolves to broader post code

  Scenario Outline: postcode outside 50 miles of the provider
    When with a cassette named "location_based_outside_50_miles_lookup_from_google_cassette" I provide <postcode> as a zipcode
    Then I should not see provider, source, category, and item

    Examples:
      | postcode     | 
      |  "IV3 5TD"   |  
      |  "LS1"       | 


  Scenario Outline: my ip resolves to a location within 50 miles of the provider
    Given my IP resolves to London
    When with a cassette named "location_based_within_50_miles_and_ip_lookup_from_google_cassette" I provide <postcode> as a zipcode
    Then I should see provider, source, category, and item

    Examples:
      | postcode     | 
      |  " "         |  
      |  "incorrect" |  
      |  "bc32 yab"  | 
  
