
Given(/^a user$/) do
  @the_user = FactoryGirl.create(:user)
  @the_user.confirm!
end

Given(/^the user has a password$/) do
  @the_user.password = "password"
  @the_user.password_confirmation = "password"
  @the_user.save
end

Given(/^an unconfirmed user$/) do
  @the_user = FactoryGirl.create(:user, :unconfirmed)
end

When(/^I sign up$/) do
  visit new_user_registration_url
  page.fill_in('user_email', :with => "john@mailinator.com")
  page.fill_in('user_first_name', :with => "John")
  page.fill_in('user_last_name', :with => "Smith")
  page.fill_in('user_password', :with => "password")
  page.fill_in('user_password_confirmation', :with => "password")
  click_button('Sign up')
  @the_user = User.last
end

Then(/^I should be the user on the platform$/) do
  @the_user.email.should eq "john@mailinator.com" 
  @the_user.first_name.should eq "John"
  @the_user.last_name.should eq  "Smith"
end

Given(/^a Facebook user$/) do
  OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
    "uid" => "1111",
    "provider" => "facebook",
    "credentials" => {
      "token" => "token",
      "secret" => "secret"
    },
    "extra" => {
      "raw_info" => {
        "name" => "John_Smith",
        "first_name" => "John",
        "last_name" => "Smith",
        "username" => "jsmith",
        "email" => "john@mailinator.com"
      }
    }
  })
  OmniAuth.config.add_mock(:facebook, OmniAuth.config.mock_auth[:facebook])
end


Given(/^a signed up Facebook user$/) do
  steps %Q{
    Given a Facebook user
    And I sign up with Facebook
    Then I sign out
  }
end

When(/^I sign in with Facebook$/) do
  step "I sign up with Facebook"
end

When(/^I sign up with Facebook$/) do
  visit "/users/auth/facebook"
end

When(/^I sign in$/) do
  visit new_user_session_url
  page.fill_in('user_email', :with => @the_user.email)
  page.fill_in('user_password', :with => "password")
  click_button('Sign in')
end

And(/^I sign in and ask to remember me$/) do
  visit new_user_session_url
  page.fill_in('user_email', :with => @the_user.email)
  page.fill_in('user_password', :with => "password")
  check('Remember me')
  click_button('Sign in')
end

Given(/^I visit the homepage$/) do
  visit root_url
end


When(/^I visit sign in page$/) do
  visit new_user_session_url
end

Given(/^a user is logged in$/) do
  @the_user.should_not be_nil
  login_as(@the_user, :scope => :user)
end

When(/^I sign out$/) do
  click_on "SIGN OUT"
end

Then(/^I request a forgotten password$/) do
  visit new_user_password_url
  page.fill_in('user_email', :with => @the_user.email)
  click_button('Send me reset password instructions')
end

Given(/^I request a resend of confirmation instructions$/) do
  visit new_user_confirmation_url 
  page.fill_in('user_email', :with => @the_user.email)
  click_button('Resend confirmation instructions')
end

When(/^I provide a new password$/) do
  page.fill_in('user_password', :with => "password")
  page.fill_in('user_password_confirmation', :with => "password")
  click_button('Change my password')
end

Given(/^I request a password change without a token$/) do
  visit edit_user_password_url
end

When(/^I attempt to reuse the password recovery link$/) do
  steps %Q{
    Given I request a forgotten password
    Given I intercept an email to the user
    Then I click on the link "Change my password" in the email
    Then I provide a new password
    And I sign out
    Then I click on the link "Change my password" in the email
    Then I provide a new password
  }
end


