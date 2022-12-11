Feature: Predictive Student Admissions
  As a student
  I want to be able to predict my chances of getting into a program based on my grades and other factors
  So that I can make an informed decision about my future

  Scenario:
    Given I am a student
    And I have a GPA of 3.8
    And I went to the University of Iowa
    When I apply to the University of Iowa
    Then I should be accepted

  Scenario:
    Given I am a student
    And I have a GPA of 3.4
    And I went to the University of Iowa
    When I apply to Harvard
    Then I should be rejected

