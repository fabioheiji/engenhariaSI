@oneMatchBefore
Feature: User navigate between pages
  The user must be able to navigate between pages

  @loginAsUser
  Scenario: user can go from home to matches page
    Given that the user is in the homepage
    When the user click on "View matches"
    Then the user should be redirected to the matches page

	@loginAsUser
  Scenario: user can go from match creation page to matches page
    Given the user is in the page's match registration
    When the user click on "View matches"
    Then the user should be redirected to the matches page
  
	@loginAsUser
  Scenario: user can go from specific match to matches page
    Given that the user visits an existing room
    When the user click on "View matches"
    Then the user should be redirected to the matches page
  
  Scenario: user can go from home page to sign up page
    Given that the user is in the homepage
    When the user click on "Sign up"
    Then the user should be redirected to the sign up page

  Scenario: user can go from login page to sign up page
    Given that the user is on the login page
    When the user click on "Sign up"
    Then the user should be redirected to the sign up page
    
  Scenario: user can go from homepage to login page
    Given that the user is in the homepage
    When the user click on "Login"
    Then the user should be redirected to the login page
  
  Scenario: user can go from sign up page to login page
    Given that the user is on the registration page
    When the user click on "Login"
    Then the user should be redirected to the login page