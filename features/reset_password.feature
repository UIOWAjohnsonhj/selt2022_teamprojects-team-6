Feature: Allow users to reset password
  As user
  I want to reset my password
  So that I can login

  Scenario:
    Given Am on the login page
    When I click the forgot password link
    Then I should see the reset password page
