Feature: Profile Feature

Scenario: Edit a User Profile
  Given I login with "Bronx" and "password"
  And I update the profile page
  Then I should see "Sweet! It worked!!!." on the page
  And I should see "alert-success" for the alert message