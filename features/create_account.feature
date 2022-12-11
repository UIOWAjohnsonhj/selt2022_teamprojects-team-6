Feature: Allow users to create an account

    As a user
    I want to create an account
    So that I can use the application


Scenario: Creating a student account
  Given I am on the Student Account Creation page
  And I fill in "first name" with "Adnane"
  And I fill in "last name" with "Ezouhri"
  And I fill in "email" with "aezouhri@uiowa.edu"
  And I fill in "password" with "password"
  And I fill in "password confirmation" with "password"
  When I Click Sign Up
  Then A new student account should be created with first name "Adnane", last name "Ezouhri", and email address "aezouhri@uiowa.edu"

Scenario: Creating a faculty account
  Given I am on the Faculty Account Creation page
  And I fill in "First name" with "Kiana"
  And I fill in "Last name" with "Erickson"
  And I fill in "Email" with "kerickson@uiowa.edu"
  And I fill in "Password" with "password"
  And I fill in "password confirmation" with "password"
  When I Click Sign Up
  Then I should see "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
