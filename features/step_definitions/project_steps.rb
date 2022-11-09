Given(/^I am on the Account Creation page$/) do
  visit main_sign_up_path
end

And(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end

And(/the student radio button is clicked/) do
  click_button 'radio_button_student'
end

Then(/^A new student account should be created with first name "(.*?)", last name "(.*?)", and email address "(.*?)"$/) do |first, last, email|
  result=false
  all("tr").each do |tr|
    if tr.has_content?(first) && tr.has_content?(last) && tr.has_content?(email)
      result = true
      break
    end
  end
  expect(result).to be_truthy
end

And(/the faculty radio button is clicked/) do
  click_button 'radio_button_faculty'
end

Then (/^I should be directed to the second sign up page to enter faculty specific information$/) do

end








And(/^my credentials are filled in$/) do
  pending
end

When(/^I Click "([^"]*)"$/) do |arg|
  pending
end



Given(/^I am an Instructor$/) do
  pending
end

And(/^I want to log in$/) do
  pending
end

When(/^I click the login button$/) do
  pending
end

Then(/^I should view a "([^"]*)" page$/) do |arg|
  pending
end

Given(/^I am a Student$/) do
  pending
end

Then(/^I should not view a "([^"]*)" page$/) do |arg|
  pending
end

And(/^my credentials are correct$/) do
  pending
end

When(/^I log in$/) do
  pending
end

Given(/^I am logged in$/) do
  pending
end

When(/^I click the "([^"]*)" button$/) do |arg|
  pending
end

Then(/^I should view the "([^"]*)" page$/) do |arg|
  pending
end

When(/^I click "([^"]*)"$/) do |arg|
  pending
end

Then(/^my data should be updated$/) do
  pending
end

Given(/^I enter "([^"]*)"$/) do |arg|
  pending
end

Then(/^I should see a welcome page$/) do
  pending
end

And(/^my credentials are filled in with an email address already registered$/) do
  pending
end


