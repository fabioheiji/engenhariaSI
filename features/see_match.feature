@oneMatchBefore
Feature: User visits specific match
  The user can see a specific match and its main information.

  Scenario: User successfully enters the match
    Given that the user visits an existing room
    Then the user see the match information

  Scenario: User cannot enter the match - match does not exist
    Given that the user visits a non-existing room
    Then the user see a message that the match does not exist