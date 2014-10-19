Feature: Inspecting the error pages
    As a user I want to be OK when an error occurs

    @allow-rescue
    Scenario: Visit a page that doesn't exist
      When I visit a page that doesn't exist
      Then I should see a "404" error page
 
    @allow-rescue
    Scenario: Visit a page that has an error
      When I visit a page that has a server error
      Then I should see a "500" error page