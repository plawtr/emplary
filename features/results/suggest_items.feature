Feature: Proposing new items for the platform
  As a user on the platform I propose new items

  Background:
    Given a user 
    And a user is logged in
    Given I visit the homepage
    And a source with provider, category and item exists
    And I want to visually inspect emails

  Scenario: correct zipcodes/postcodes
    Given with a cassette named "London_postcode_lookup_from_google_cassette" I provide "EC2A3PT" as a zipcode
    When I request to suggest items
      Then I should see "Suggest new item"
    When with a cassette named "mailgun_email_cassette" I submit the suggested item 
      Then I should see "Suggestion accepted." 
