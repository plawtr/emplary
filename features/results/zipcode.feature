Feature: Getting location based on zipcode
  As a user on the platform I enter my zipcode and receive my location

  Background:
    Given I visit the homepage
    And a source with provider, category and item exists

  Scenario Outline: correct zipcodes/postcodes
    When with a cassette named "zipcode_lookup_from_google_cassette" I provide <postcode> as a zipcode
    Then I should see <the message>

    Examples:
      | postcode   | the message                      | 
      |  "94035"   |  "Mountain View, CA 94035, USA"  |
      |  "10280"   |  "New York, NY 10280, USA"       |
      |  "10280 "  |  "New York, NY 10280, USA"       |
      |  "EC2A3PT" |  "London EC2A 3PT, UK"           |
      |  "EC2A3 PT"|  "London EC2A 3PT, UK"           |
      |  "E84dg "  |  "London E8 4DG, UK"             |
      |  "IV3 5TD" |  "Inverness, Inverness, Highland IV3 5TD, UK" |
      |  "sw1E 2jl"|  "London SW1E, UK"               |
       # last one is partially correct but resolves to broader post code

  Scenario Outline: incorrect zipcodes/postcodes
    When with a cassette named "incorrect_zipcode_lookup_from_google_cassette" I provide <postcode> as a zipcode
    Then I should be on the root page
    And I should see "Invalid zipcode."

    Examples:
      | postcode     | 
      |  "incorrect" |  
      |  "90219"     | 
      |  ""          | 
      |  "bc32 yab"  | 

  Scenario: correct London postcode results in a page with structured results
    When with a cassette named "London_postcode_lookup_from_google_cassette" I provide "EC2A3PT" as a zipcode
      Then I should see "Results in London EC2A 3PT, UK" 
      And I should see provider name
      And I should see source name
      And I should see category name
      And I should see item name
    Given another source with provider, category and item exists 
      And I visit the homepage
      When with a cassette named "London_postcode_lookup_from_google_cassette" I provide "EC2A3PT" as a zipcode
        Then I should see provider name
        And I should see source name
        And I should see category name
        And I should see item name

