Feature: Visit the welcome page
  As a user
  I want to view a page upon newly entering the app
  So that I can have general information


  Scenario:
    Given I enter the application's URL
    When I enter "URL"
    Then I should see a welcome page
