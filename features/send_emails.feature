Feature: Allow users to receive email notifications

    As a user
    I want to be sent an email
    So that I can be notified when my admission decision changes


Scenario: Sending an email when applicant is accepted
  Given I am on the admissions decision page of a student
  When I click the Accept button
  Then A(n) "acceptance" email should be sent


Scenario: Sending an email when applicant is rejected
  Given I am on the admissions decision page of a student
  When I click the Reject button
  Then A(n) "rejection" email should be sent

Scenario: Sending an email when applicant is waitlisted
  Given I am on the admissions decision page of a student
  When I click the Waitlist button
  Then A(n) "waitlist" email should be sent

