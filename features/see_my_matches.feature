@loginAsUser
Feature: See my matches

Scenario: See all my matches
  Given the user has created matches
  And the user clicks on 'Minhas partidas'
  Then the user should see all owned matches
  But not matches created by anyone else

Scenario: There are no matches created by me
  Given the user clicks on 'Minhas partidas'
  Then the user should see the text "Você ainda não criou uma partida."