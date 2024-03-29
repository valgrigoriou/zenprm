Feature: Community Network Profile

Scenario: As a provider I want to update my profile so that I am accurately targeted for projects
  Given I login with "1588654511" and "password"
  And I update the profile page
  Then I should see "Sweet! It worked!!!." on the page
  And I should see "alert-success" for the alert message
  
Scenario: As a provider I want to view my profile so that I can review my information
  Given I login with "1588654511" and "password"
  And I verify the basic profile page panels
  
Scenario: As a provider I want to logout of my account so that my account is secure
  Given I login with "1588654511" and "password"
  Then I should be on the "/#/profile" page
  When I logout
  Then I should be on the "/#/login" page
  
Scenario: As a provider I want to be able to change my email preferences so that I’m not spammed
  Given I login with "1588654511" and "password"
  Then I should be on the "/#/profile" page
  
Scenario: As a provider I want to create multiple email addresses on my profile so that I can work with multiple organizations
  Given I login with "1588654511" and "password"
  And I add a new email address
  
Scenario: As a provider I want to view my profile so that I can review and fulfill open projects / requirements
  Given I login with "1588654511" and "password"
  Then I should be on the "/#/profile" page
  And I am on the projects page
  And I open the first project
  
Scenario: As a provider I want to view my profile so that I can reference past projects
  Given I login with "1588654511" and "password"
  And I view the projects tab
  Then I should see "Archived Projects" on the page
  
# Scenario: As a provider I want to view my profile so that I can see files I previously attached to a project

  