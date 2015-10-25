Feature: Community Network Profile

Scenario: As a provider I want to update my profile so that I am accurately targeted for projects
  Given I login with "Bronx" and "password"
  And I update the profile page
  Then I should see "Sweet! It worked!!!." on the page
  And I should see "alert-success" for the alert message