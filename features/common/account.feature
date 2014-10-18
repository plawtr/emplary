Feature: Logging in and finding your accounts
    As a user on the platform I want to be able to login


    Scenario: a user can sign up
      Given a user 
      When I sign up
      Then I should see "Signed in successfully."

    Scenario: a user can sign in
      Given a user 
      When I sign in
      Then I should see "Signed in successfully."

    Scenario: a signed in user cannot sign in again
      Given a user 
      And a user is signed in
      When I sign in
      Then I should see "You are already signed in."
