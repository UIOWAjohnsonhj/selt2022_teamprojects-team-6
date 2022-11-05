Feature: Allow users to creat an account

    As a user
    I want to create an account
    So that I can use the application


Scenario: Creating an account
  Given I am on the Account Creation page
  And my credentials are filled in
  When I Click "Sign up"
  Then A new account should be created
