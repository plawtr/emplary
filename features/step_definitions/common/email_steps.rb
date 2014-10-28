
Given(/^I intercept an email to the user$/) do
  open_email(@the_user.email)
end

Given(/^I intercept an email to site admin$/) do
  open_email("a.krahmal@gmail.com")
end

Given(/^I click on the link "(.*?)" in the email$/) do |text|
  current_email.click_link text
end

Then(/^the email should contain "(.*?)"$/) do |content|
  current_email.should have_content(/#{content}/i)
end

Then(/^I save and open the email/) do
  current_email.save_and_open if  @save_and_open
end

Given(/^I want to visually inspect emails$/) do
  @save_and_open = true
end