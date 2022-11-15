Feature: User kicks player from match created by him
  The user can kick another player from their match.

    Scenario Outline: Kick player successfully
        Given that the user visits one of his matches
        Then the user should see the "Kick player" button next to the name of each participant in the match
        When the user clicks on this button
        Then the user should not see the name of the player he kicked out in the match participants list