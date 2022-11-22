Feature: User kicks player from match created by him
  The user can kick another player from their match.

    Scenario: Kick player successfully
      Given that the user visits one of his matches
      Then the user should see the "Expulsar participante" button next to the name of each participant in the match
      When the user clicks the 'Expulsar participante' button he should not see the name "LeBron James - Small Forward (SF)" in the list anymore

    Scenario: User visits a match he doesn't own 
      Given that the user is on the page of a match that he does not own
      Then the user shouldn't see the "Expulsar participante" button next to the name of each participant in the match