Feature: Allow instructor to log in

  As an instructor
  I want to log in
  So that I can interact with the application

  Scenario: Valid login
    Given I am an Instructor
    And I want to log in
    When I click the login button
    Then I should view a "My Evaluations" page

  Scenario: Invalid login
    Given I am a Student
    And I want to log in
    When I click the login button
    Then I should not view a "My Evaluations" page
