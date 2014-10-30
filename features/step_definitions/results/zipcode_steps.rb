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

Then(/^I should see provider$/) do
  page.should have_content @the_source.providers.first.name
end

Then(/^I should see source$/) do
  page.should have_content @the_source.name
end

Then(/^I should see category$/) do
  page.should have_content @the_source.categories.first.name
end

Then(/^I should see item$/) do
  page.should have_content @the_source.items.first.name
end

Then(/^I should not see provider$/) do
  page.should_not have_content @the_source.providers.first.name
end

Then(/^I should not see source$/) do
  page.should_not have_content @the_source.name
end

Then(/^I should not see category$/) do
  page.should_not have_content @the_source.categories.first.name
end

Then(/^I should not see item$/) do
  page.should_not have_content @the_source.items.first.name
end

Given(/^my IP resolves to London$/) do 
  class ActionDispatch::Request
    def remote_ip
      "82.35.196.222" 
    end
  end
end