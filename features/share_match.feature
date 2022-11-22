@loginAsUser
@oneMatchBefore
Feature: User must be able to share a game
  the user clicks on a specific button to participate in a specific match

  Scenario: Share game button appears
    Given the user visits last created match
    Then the user should see the text "Compartilhar partida"

  Scenario: Share match button appears - full match
    Given a newly created match with the maximum number of participants reached
    And the user visits last created match
    Then the user should not see the text "Compartilhar partida"
    