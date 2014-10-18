
Given(/^a user$/) do
  @user = User.new(admin: false, first_name: "John", last_name: "Smith", email: "j.smith@mailinator.com", password: "password", password_confirmation: "password" )

  @user2 = FactoryGirl.create(:user, :email => "j.smith@mailinator.com")
end

When(/^I sign up$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I sign in$/) do
  visit new_user_session_path
  page.fill_in('email', :with => @user.email)
  pending # express the regexp above with the code you wish you had
end

Given(/^a user is signed in$/) do
  pending # express the regexp above with the code you wish you had
end
