Feature: Allow users to creat an account

    As a user
    I want to create an account
    So that I can use the application


Scenario: Creating a student account
  Given I am on the Account Creation page
  And I fill in "First name" with "Adnane"
  And I fill in "Last name" with "Ezouhri"
  And I fill in "Email address" with "aezouhri@uiowa.edu"
  And I fill in "Password" with "password"
  And the student radio button is clicked
  When I Click "Create account"
  Then A new student account should be created with first name "Adnane", last name "Ezouhri", and email address "aezouhri@uiowa.edu"

Scenario: Creating a faculty account
  Given I am on the Account Creation page
  And I fill in "First name" with "Kiana"
  And I fill in "Last name" with "Erickson"
  And I fill in "Email address" with "kerickson@uiowa.edu"
  And I fill in "Password" with "password"
  And the faculty radio button is clicked
  Then I should be directed to the second sign up page to enter faculty specific information

  Given I am on the second sign up page for faculty
  And I fill in "University Name" with "University of Iowa"
  And I upload an image of my "college_id"
  When I click "Sign Up"
  Then a new faculty account should be created

  Given I am on the second sign up page for faculty
  And I fill in "University Page Link" with "www.myuniversity.com"
  When I click "Sign Up"
  Then a new faculty account should be created
