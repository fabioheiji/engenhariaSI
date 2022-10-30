@oneMatchBefore
Feature: User navigate between pages
  The user must be able to navigate between pages
  
  Scenario: user can go from home page to sign up page
    Given the user visits "/"
    When the user click on "Sign up"
    Then the user should be in "/signup"

  Scenario: user can go from login page to sign up page
    Given the user visits "/login"
    When the user click on "Sign up"
    Then the user should be in "/signup"
    
  Scenario: user can go from homepage to login page
    Given the user visits "/"
    When the user click on "Login"
    Then the user should be in "/login"
  
  Scenario: user can go from sign up page to login page
    Given the user visits "/signup"
    When the user click on "Login"
    Then the user should be in "/login"