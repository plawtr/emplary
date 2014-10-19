
Given(/^I intercept an email to the user$/) do
  open_email(@the_user.email)
end

Given(/^I click on the link "(.*?)" in the email$/) do |text|
  current_email.click_link text
end

Then(/^the email should contain "(.*?)"$/) do |content|
  current_email.should have_content(/#{content}/i)
end