
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
  expect(page).to have_content("FacultyMember Sign Up")
end

And(/^my credentials are filled in$/) do
  pending
end

When(/^I Click "([^"]*)"$/) do |arg|
  click_button(arg)
end

Given(/^I am an Instructor$/) do
  pending

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
  expect(page).to have_content(arg)
end

When(/^I click "([^"]*)"$/) do |arg|
  click_button(arg)
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

And(/^I have previously set up a profile picture$/) do
  pending
end

Then(/^I should the image "(.+)" as my profile picture$/) do |image|
  page.should have_xpath("//img[@src=\"/public/images/#{image}\"]")
end

Given(/^Am on the login page$/) do
  visit main_login_path
end

When(/^I click the forgot password link$/) do
  visit reset_password
end

Then(/^I should see the reset password page$/) do
  expect(page).to have_content("Reset Password")
end

Given(/^the following account has been added to Faculties:$/) do |table|
  # table is a table.hashes.keys # => [:first_name, :last_name, :email, :password]
  table.hashes.each do |faculty|
    FacultyMember.create!(faculty)
  end
end

When(/^I click the "([^"]*)" button$/) do |arg|
  click_button(arg)
end

And(/^I am on the "([^"]*)" page$/) do |arg|
  expect(page).to have_content(arg)
end

Given(/^the following account has been added to Students:$/) do |table|
  # table is a table.hashes.keys # => [:first_name, :last_name, :email, :password]
  table.hashes.each do |student|
    Student.create!(student)
  end
end

Given(/^I am on the Welcome page$/) do |arg|
  expect(page).to have_content(arg)
end

When(/^I click the "([^"]*)" link$/) do |arg|
  click_link(arg)
end

Then(/^I should be on the "([^"]*)" page$/) do |arg|
  expect(page).to have_content(arg)
end

Given(/^I am on the admissions decision page of a student$/) do

  visit profile_viewer_path
end

Then(/^A\(n\) "([^"]*)" email should be sent$/) do |arg|
  @email = ActionMailer::Base.deliveries.first
  @email.from.should == "simplapplyselt@gmail.com"
  @email.body.should include(arg)
end

When(/^I click the Accept button$/) do
  ActionMailer::Base.delivery_method = :test
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.deliveries.clear
  click_button 'Accept'
end

When(/^I click the Reject button$/) do
  ActionMailer::Base.delivery_method = :test
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.deliveries.clear
  click_button 'Reject'
end

When(/^I click the Waitlist button$/) do
  ActionMailer::Base.delivery_method = :test
  ActionMailer::Base.perform_deliveries = true
  ActionMailer::Base.deliveries.clear
  click_button 'Waitlist'
end

Given(/^I am a student$/) do
  visit main_index_path
  click_button 'Login'
  click_button 'student_button'
  fill_in 'email', :with => 'ben.desollar01@gmail.com'
  fill_in 'password', :with => '123456'
end
