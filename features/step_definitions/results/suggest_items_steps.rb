
Then(/^I request to suggest items$/) do
  click_link('Suggest new items »')
end 

When(/^I submit the suggested item$/) do
  page.fill_in('name', :with => "Grassfed Butter")
  page.fill_in('url', :with => "http://www.ocado.com/yummybutter")
  page.fill_in('description', :with => "Just saw this and it is delicious")
  click_button('Submit')
end