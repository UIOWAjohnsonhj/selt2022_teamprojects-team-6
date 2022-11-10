Feature: Allow students to login
  As a student
  I want to log in
  So that I can interact with the application

  Background: accounts have been added to Student and Faculty

    Given the following account has been added to Students:
      | first_name | last_name | email | password
      | student | last | student123@university.edu  | pw123

    Given the following account has been added to Faculties:
      | first_name | last_name | email | password
      | instructor | last | instructor@university.edu  | pw1234

  Scenario: Valid login
    Given I am a Student
    And I fill in "Email" with "student123@university.edu"
    And I fill in "Password" with "pw123"
    When I click the login button
    Then I should view a "My Profile" page

  Scenario: Invalid login of faculty
    Given I am an Instructor
    And I fill in "Email" with "instructor@university.edu"
    And I fill in "Password" with "pw1234"
    When I click the login button
    Then I should not view a "My Profile" page
