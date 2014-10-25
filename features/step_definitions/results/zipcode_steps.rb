Given(/^I provide "(.*?)" as a zipcode$/) do |zipcode|
  page.fill_in('postcode', :with => zipcode)
  click_button('GO')  
end

Given(/^a source with provider, category and item exists$/) do
  @the_source = FactoryGirl.create :source_with_dependents
end
Given(/^another source with provider, category and item exists$/) do
  @the_source = FactoryGirl.create :source_with_dependents
end

Then(/^I should see provider name$/) do
  page.should have_content @the_source.providers.first.name
end

Then(/^I should see source name$/) do
  page.should have_content @the_source.name
end

Then(/^I should see category name$/) do
  page.should have_content @the_source.categories.first.name
end

Then(/^I should see item name$/) do
  page.should have_content @the_source.items.first.name
end
