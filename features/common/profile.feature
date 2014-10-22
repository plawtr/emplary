Feature: Managing your profile
    As a user on the platform I want to be able to manage my profile.

    Background:
      Given a user 
      And the user has a password
      And I sign in

    Scenario: a user can change his/her profile
      When I visit the profile page
        Then my information should be prefilled 
      When I edit my information 
        Then I should see "You updated your account successfully"
        And my information should be edited

    Scenario: a user can change his/her password
      When I visit the profile page
        And I edit my password 
        Then I should see "You updated your account successfully"
      When I sign out 
        And I sign in with the new password
        Then I should see "Signed in successfully."