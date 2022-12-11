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
  Then A new faculty account should be created with first name "Kiana", last name "Erickson", and email address "


  Given I am on the second sign up page for faculty
  And I fill in "University Name" with "University of Iowa"
  And I upload an image of my "college_id"
  When I click "Sign Up"
  Then a new faculty account should be created

  Given I am on the second sign up page for faculty
  And I fill in "University Page Link" with "www.myuniversity.com"
  When I click "Sign Up"
  Then a new faculty account should be created
