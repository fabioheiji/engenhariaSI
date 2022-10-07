Feature: User sees specific match
  The user can see a specific match and its main information.

  Scenario Outline: User successfully enters the room
    Given the user is on match page
    Then the user see the match information

  Scenario Outline: User cannot enter the room - room does not exist
    Given the user is in a non-existent match
    Then the user see a message that the match does not exist

  Scenario Outline: User cannot enter the room - user is not logged in
    Given the user is in on match page and not logged in
    Then the user is redirected to homepage