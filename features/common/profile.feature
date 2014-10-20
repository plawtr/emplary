Feature: Managing your profile
    As a user on the platform I want to be able to manage my profile.

    Background:
      Given a user 
      And I sign in

    Scenario: a user can change his/her profile
      When I visit the profile page
        Then my information should be prefilled 
