Feature: User visits specific match
  The user can see a specific match and its main information.

  Scenario Outline: User successfully enters the match
    Given that user visits existing match page
    Then the user see the match information

  Scenario Outline: User cannot enter the match - match does not exist
    Given that user visits non-existing match page
    Then the user see a message that the match does not exist