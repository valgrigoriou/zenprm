Feature: Login Process Feature

Scenario: As a Customer (Administrator) I want to login so I can manage the system
   Given I login with "Bronx" and "password"
   Then I should be on the "/#/" page
   When I logout
   Then I should be on the "/#/login" page