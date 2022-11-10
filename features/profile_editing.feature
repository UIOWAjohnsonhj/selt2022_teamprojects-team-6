Feature: Allow users to edit their profile
  As a student
  I want to edit my profile
  So that it can stay up to date

#Scenarios should be more specific, what do you update needs to be writting
# So you can check if that value is present
# Example: the only see movies rated PG, R feature in HW5
  Scenario:
    Given I am a Student
    When I modify information in my profile
    When I click "edit"
    Then my data should be updated

  Scenario: Uploading profile picture
    Given I am a Student
    And I have previously set up a profile picture
    And I am on the "Edit Profile" page
    Then I should the image "profile.jpeg" as my profile picture

