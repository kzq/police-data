Given(/^I am on the home page$/) do
  visit root_path
end

When(/^I provide my postcode (.*)$/) do |post_code|
  fill_in "searchBox", with: post_code 
  click_button('btnSearch')
end

Then(/^I should see "([^"]*)"$/) do |text_heading|
  pending # Write code here that turns the phrase above into concrete actions
end
