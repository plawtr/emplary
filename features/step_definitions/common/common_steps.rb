Then(/^I should see "(.*?)"$/) do |content|
  page.should have_content content
end

Then(/^I should not see "(.*?)"$/) do |content|
  page.should_not have_content content
end

When(/I open the page/) do
  save_and_open_page
end

When(/I inspect the page/) do
  binding.pry
end