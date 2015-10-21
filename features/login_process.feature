Feature: Login Process Feature

Scenario: As a Customer (Administrator) I want to login so I can manage the system
  Given I login with "Bronx" and "password"
  And I should see "alert-success" for the alert message
  Then I should be on the "/#/" page
  When I logout
  Then I should be on the "/#/login" page
  
Scenario: As a Provider I want to login so I can respond to a project request
  Given I login with "1588654511" and "password"
  And I should see "alert-success" for the alert message
  Then I should be on the "/#/profile" page
  When I logout
  Then I should be on the "/#/login" page
  
Scenario: As a Provider I want to retrieve my password so I can login
  Given I am on the forgot password page
  And I submit the following email "zenprm44@gmail.com"
  And I should see "alert-success" for the alert message
  Then I verify email was sent
  
Scenario: As a provider I want to retrieve my username so I can login
# I do not see a "Request Username" link anywhere
  
Scenario: Login as an Invalid Provider
  Given I login with "Invalid" and "password"
  Then I should see "Invalid Username or Password" on the page
  And I should see "alert-error" for the alert message