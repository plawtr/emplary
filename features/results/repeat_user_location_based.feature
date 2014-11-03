Feature: Getting location based results
  As a repeat user on the platform I only have to enter my zipcode once (or until I tell the platform to forget my location) to receive results based on proximity to my location

  Background:
    Given a user 
    And the user has a password
    Given I visit the homepage
    And a source with provider, category and item exists

  Scenario Outline: postcode within 50 miles of the provider
    When with a cassette named "location_based_within_50_miles_lookup_from_google_cassette" I provide <postcode> as a zipcode
      Then I should see provider, source, category, and item
    Given I sign in
    And with a cassette named "location_based_within_50_miles_lookup_from_google_cassette" I provide <postcode> as a zipcode
      Then I should see provider, source, category, and item
    Given I visit the homepage
      Then I should see provider, source, category, and item
    Given I sign out
      Then I should not see provider, source, category, and item
    Given I sign in
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
    When I sign in
    And with a cassette named "location_based_outside_50_miles_lookup_from_google_cassette" I provide <postcode> as a zipcode
      Then I should not see provider, source, category, and item
    Given I visit the homepage
      Then I should not see provider, source, category, and item
    Given I sign out
      Then I should not see provider, source, category, and item
    Given I sign in
      Then I should not see provider, source, category, and item

    Examples:
      | postcode     | 
      |  "IV3 5TD"   |  
      |  "LS1"       | 

  Scenario Outline: my ip resolves to a location within 50 miles of the provider
    Given my IP resolves to London
    When with a cassette named "location_based_within_50_miles_and_ip_lookup_from_google_cassette" I provide <postcode> as a zipcode
      Then I should see "Invalid US/UK zipcode, using location from your IP address."
      Then I should see provider, source, category, and item
    When I sign in
    And with a cassette named "location_based_within_50_miles_and_ip_lookup_from_google_cassette" I provide <postcode> as a zipcode
      Then I should see "Invalid US/UK zipcode, using location from your IP address."
      And I should see "London"
      And I should see provider, source, category, and item
    Given I visit the homepage
      Then I should see "London"
      And I should see provider, source, category, and item
    Given I sign out
      Then I should not see provider, source, category, and item
    Given I sign in
      Then I should see "London"
      Then I should see provider, source, category, and item

    Examples:
      | postcode     | 
      |  " "         |  
      |  "incorrect" |  
      |  "bc32 yab"  | 
 
    Scenario Outline: user asks the platform to forget his location
      Given I sign in
      And with a cassette named "location_based_within_50_miles_lookup_from_google_cassette" I provide <postcode> as a zipcode
        Then I should see provider, source, category, and item
      Given I click "Change location"
      And with a cassette named "another_zipcode_lookup_from_google_cassette" I provide <new postcode> as a zipcode
        Then I should see <my location>
      Given I sign out
        Then I should not see provider, source, category, and item
      Given I sign in
        Then I should see <my location>

      Examples:
        | postcode   | new postcode   |  my location                     |
        |  "EC2A3PT" | "94035"        |  "Mountain View, CA 94035, USA"  |
        |  "EC2A3 PT"| "10280"        |  "New York, NY 10280, USA"       |
        |  "E84dg "  | "IV3 5TD"      |  "Inverness, Inverness, Highland IV3 5TD, UK" |
        |  "sw1E 2jl"| "EC2A3PT"      |  "London EC2A 3PT, UK"           |


