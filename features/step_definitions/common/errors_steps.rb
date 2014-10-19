

When(/^I visit a page that doesn't exist$/) do
  visit "/users/doesnotexist"
end

Then(/^I should see a "(.*?)" error page$/) do |code|
  page.should have_content code
end

When(/^I visit a page that has a server error$/) do
  UsersController.any_instance.stub(:new).and_raise(ArgumentError)
  visit "/users/new"
end

When(/^I visit a page that has an error$/) do
  UsersController.any_instance.stub(:new).and_raise(ArgumentError)
  visit "/users/new"
end

When(/^I visit an unauthorized page$/) do
  post "/users/sign_in", email: "wrong_email@wrong.com", password: "wrong_password"
end
