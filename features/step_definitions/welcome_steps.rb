Given(/^I am on the welcome page$/) do
  visit ('/')
end

When(/^I click view button$/) do
  page.click_button("View Videos")
end

Then(/^I should go to video page$/) do
  visit ('/')
end

