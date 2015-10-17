Feature: Login Process Feature
  
Scenario: Login and Logout as a Valid User
  Given I login with "Bronx" and "password"
  When I logout
  Then I should be on the "/#/login" page

Scenario: Login as an Invalid User
  Given I login with "Invalid" and "password"
  Then I should see "Invalid Username or Password" on the page
  
  # Scenario: As a provider I want to login so I can respond to a project request
  #
  # Scenario: As a provider I want to retrieve my password so I can login
  #
  # Scenario: As a provider I want to retrieve my username so I can login
  #
  # Scenario: As a provider I want to logout so that I can safely move on with my life