Given(/^I input the username and password$/) do
  visit ('/')
end

When(/^I click login button$/) do
  page.click_button("Login")
end

Then(/^I should go to adminstration page$/) do
  visit ('/')
end

