Feature: User visits specific match
  The user can see a specific match and its main information.

  Scenario: User successfully enters the match
    Given an existing match 
    When the user visits the match "1"
    Then the user see the match information

  Scenario: User cannot enter the match - match does not exist
    Given an non-existing match
    When the user visits the match "2"
    Then the user see a message that the match does not exist    