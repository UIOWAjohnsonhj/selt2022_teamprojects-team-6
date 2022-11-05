Feature: Allow users to creat an account

    As a user
    I want to create an account
    So that I can use the application


Scenario: Creating an account
  Given I am on the Account Creation page
  And I fill in "First name" with "Adnane"
  And I fill in "Last name" with "Ezouhri"
  And I fill in "Email address" with "aezouhri@uiowa.edu"
  And I fill in "Password" with "password"
#  Need to check the radio button
  When I Click "Create account"
  Then A new account should be created
