@oneMatchBefore
Feature: User navigate between pages
  The user must be able to navigate between pages
  
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