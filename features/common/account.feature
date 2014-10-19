Feature: Logging in and finding your accounts
    As a user on the platform I want to be able to login


    Scenario: a user can sign up
      When I sign up
        Then I should see "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."
      Given I intercept an email to the user
        Then the email should contain "You can confirm your account email through the link below"
      When I click on the link "Confirm my account" in the email
      Then I should see "Your account was successfully confirmed"

    Scenario: a user can sign up with Facebook
      Given a Facebook user 
      When I sign up with Facebook
      Then I should see "Successfully authenticated from Facebook account." 

    Scenario: a user can sign in
      Given a user 
      When I sign in
      Then I should see "Signed in successfully."

    Scenario: a user can sign in with Facebook
      Given a signed up Facebook user 
      When I sign in with Facebook
      Then I should see "Successfully authenticated from Facebook account." 

    Scenario: a signed in user cannot sign in again
      Given a user 
      And I sign in
      When I visit sign in page
      Then I should see "You are already signed in."

    Scenario: an unconfirmed user cannot sign in
      Given an unconfirmed user 
      When I sign in
      Then I should see "You have to confirm your account before continuing."

    Scenario: a user can sign out
      Given a user 
      And a user is logged in  
      And I visit the homepage
      When I sign out
      Then I should see "Signed out successfully."

    Scenario: a user can request a resend of confirmation instructions


    Scenario: a user can recover a forgotten password
      Given a user 
      And I request a forgotten password
        Given I intercept an email to the user
      Then I should see "You will receive an email with instructions on how to reset your password in a few minutes."  
      And the email should contain "Someone has requested a link to change your password. You can do this through the link below."
      When I click on the link "Change my password" in the email
      Then I should see "Change your password"
      When I provide a new password
      Then I should see "Your password was changed successfully. You are now signed in."

    Scenario: a user cannot recover a forgotten password with an invalid recovery token
      Given a user 
      When I attempt to reuse the password recovery link
      Then I should see "Reset password token is invalid"
      
    Scenario: a user is allowed to edit password via password reset email only
      Given I request a password change without a token 
      Then I should see "You can't access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided."