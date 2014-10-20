
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
