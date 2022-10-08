Feature: User visits list of matches
  The user can view, enter and create new matches

  Scenario: User see list of matches
    Given a list of matches 
    When the user visits the page
    Then the user see the matches information
  
  Scenario: User want to see specific match
    Given a list of matches
    When the user click on "view"
    Then the user is redirected to specific match

  Scenario: User wants to create a new match
    Given a list of matches
    When the user click on "create new match"
    Then the user is redirected to match creation
  
  
  