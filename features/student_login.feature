Feature: Allow students to login
  As a student
  I want to log in
  So that I can interact with the application


  Scenario: Valid Student login
    Given I am a Student
    And my credentials are correct
    When I log in
    Then I should view the "My profile" page

  Scenario: Invalid login
    Given I am an Instructor
    And my credentials are correct
    When I log in
    Then I should not view the "My profile" page
