
Given(/^I visit the profile page$/) do
  visit edit_user_registration_url
end

Then(/^my information should be prefilled$/) do
  field_labeled('user[email]').value.should =~ /#{@the_user.email}/
  field_labeled('user[first_name]').value.should =~ /#{@the_user.first_name}/
  field_labeled('user[last_name]').value.should =~ /#{@the_user.last_name}/
end

Then /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  field_labeled(field).value.should =~ /#{value}/
end

When(/^I edit my information$/) do
  page.fill_in('user_email', :with => "new_email@mailinator.com")
  page.fill_in('user_first_name', :with => "New John")
  page.fill_in('user_last_name', :with => "New Smith")
  page.fill_in('user_current_password', :with => "password")
  click_button('Update')
  @the_user.reload
  binding.pry
end

Then(/^my information should be edited$/) do
  steps %Q{
    Given I visit the profile page
    Then my information should be prefilled
  }
end