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

Given(/^I visit the homepage$/) do
  visit root_url
end

Then(/^I should be on the (.+?) page$/) do |page_name|
  URI.parse(current_url).path.should include send("#{page_name.downcase.gsub(' ','_')}_path")
end

When(/^with a cassette named "([^"]*)" (.*)$/) do |cassette_name, step|
  VCR.use_cassette(cassette_name) { step step }
end