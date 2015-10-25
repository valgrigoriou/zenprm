Feature: Login Process Feature

Scenario: As a Provider I want to login so I can respond to a project request
  Given I login with "1588654511" and "password"
  Then I should be on the "/#/profile" page
  When I logout
  Then I should be on the "/#/login" page
  
Scenario: As a Provider I want to retrieve my password so I can login
  Given I am on the forgot password page
  And I submit the following email "zenprm44@gmail.com"
  And I should see "alert-success" for the alert message
  Then I verify email was sent

Scenario: As a Provider I want to return to login from forgot password page
  Given I am on the forgot password page
  And I return to login
  Then I should be on the "/#/login" page
  
Scenario: As a provider I want to retrieve my username so I can login
  Given I am on the forgot username page
  
Scenario: Login as an Invalid Provider
  Given I login with "Invalid" and "password"
  Then I should see "Invalid Username or Password" on the page
  And I should see "alert-error" for the alert message