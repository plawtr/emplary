Given(/^I provide "(.*?)" as a zipcode$/) do |zipcode|
  page.fill_in('postcode', :with => zipcode)
  click_button('GO')  
end
