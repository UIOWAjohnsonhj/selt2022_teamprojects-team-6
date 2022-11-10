Feature: Unique email per user

  As a customer
  I only want my email linked to one account
  So that it's more secure

  Scenario:
    Given I am on the Account Creation page
    And my credentials are filled in with an email address already registered
    When I Click "Sign up"
    Then I should get an error message

