Feature: Authentication Feature

Scenario: Login and Logout as a Valid User
  Given I login with "Bronx" and "password"
  When I logout
  Then I should be on the "/#/login" page

Scenario: Login as an Invalid User
  Given I login with "Invalid" and "password"
  Then I should see "Invalid Username or Password" on the page