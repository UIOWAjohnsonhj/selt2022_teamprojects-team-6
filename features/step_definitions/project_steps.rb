
Given(/^I am on the Account Creation page$/) do
  visit main_sign_up_path
end

And(/^I fill in "([^"]*)" with "([^"]*)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end

And(/^the student radio button is clicked$/) do
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

And(/^the faculty radio button is clicked$/) do
  click_button 'radio_button_faculty'
end

Then (/^I should be directed to the second sign up page to enter faculty specific information$/) do
  expect(page).to have_content("Faculty Sign Up")
end

And(/^my credentials are filled in$/) do
  pending
end

When(/^I Click "([^"]*)"$/) do |arg|
  click_button(arg)
end

Given(/^I am an Instructor$/) do
  fake_instructor = double('Faculty')
  allow(fake_instructor).to receive(:username).and return("instructor")

end

When(/^I click the login button$/) do
  click_button 'login_button'
end

Then(/^I should view a "([^"]*)" page$/) do |arg|
  expect(page).to have_content(arg)
end

Given(/^I am a Student$/) do
  pending
end

Then(/^I should not view a "([^"]*)" page$/) do |arg|
  expect(page).to have_no_content(arg)
end

Given(/^I am logged in$/) do
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
  expect(page).to have_content("Welcome")
end

And(/^my credentials are filled in with an email address already registered$/) do
  pending
end

When(/^I modify information in my profile$/) do
  pending
end

Then(/^I should not view the "([^"]*)" page$/) do |arg|
  expect(page).to have_content(arg)
end

Then(/^I should get an error message$/) do
  pending
end

Given(/^I enter the application's URL$/) do
  pending
end

Given(/^I am on the second sign up page for faculty$/) do
  pending
end

And(/^I upload an image of my "([^"]*)"$/) do |arg|
  pending
end

And(/^I am on the "([^"]*)" page$/) do |arg|
  pending
end

And(/^I have previously set up a profile picture$/) do
  pending
end

Then(/^I should the image "(.+)" as my profile picture$/) do |image|
  page.should have_xpath("//img[@src=\"/public/images/#{image}\"]")
end

Given(/^Am on the login page$/) do
  pending
end

When(/^I click the forgot password link$/) do
  visit reset_password
end

Then(/^I should see the reset password page$/) do
  expect(page).to have_content("Reset Password")
end
