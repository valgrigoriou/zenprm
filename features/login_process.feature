Feature: Login Process Feature

Scenario Outline: As a Customer or Provider I want to logout so that I can safely move on with my life
  Given I login with <username> and <password>
  Then I should be on the <landing_page> page
  When I logout
  # Then I should be on the "/#/login" page
Examples:
  | user_type  | username     | password   | landing_page |
  | "Customer" | "Bronx"      | "password" | "/#/"        |
  | "Provider" | "1588654511" | "password" | "/#/profile" |
  
Scenario: As a provider I want to logout so that I can safely move on with my life
  Given I login with "1588654511" and "password"
  When I logout
  Then I should be on the "/#/login" page
  
Scenario: As a provider I want to login so I can respond to a project request
  Given I login with "Bronx" and "password"
  Then I should see " Logged In Successfully" on the page
  And I am on the projects page
  Then I should see exisiting projects
  
Scenario: As a provider I want to retrieve my password so I can login
# Do you want this Scenario to visit http://zenprmalpha.ahealthtech.com//#/forgotpassword and Request a new password?
# If you want a full end-to-end test we can maybe set up a Provider with an Gmail address
# I can use the GMAIL Rubygem https://rubygems.org/gems/gmail/versions/0.6.0 to click through the Reset Password Flow
  
Scenario: As a provider I want to retrieve my username so I can login
# I do not see a "Request Username" link anywhere
  
Scenario: Login as an Invalid User
  Given I login with "Invalid" and "password"
  Then I should see "Invalid Username or Password" on the page