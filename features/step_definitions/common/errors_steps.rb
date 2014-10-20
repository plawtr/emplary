

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
  visit rails_admin_url
  steps %Q{
    When I sign in
  }
end
