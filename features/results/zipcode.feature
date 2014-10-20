Feature: Getting location based on zipcode
    As a user on the platform I enter my zipcode and receive my location

    Scenario:
      Given I visit the homepage
      And I provide "94035" as a zipcode
      Then I should see "Results in your area Mountain View, CA"