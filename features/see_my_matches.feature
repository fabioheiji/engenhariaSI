@loginAsUser
Feature: See my matches

Scenario: See all my matches
  Given the user has created or participated in matches
  And the user clicks on 'Minhas partidas'
  Then the user should see all owned matches and all the matches he participated in
  And not the matches he is not participating 

Scenario: There are no matches created by me
  Given the user clicks on 'Minhas partidas'
  Then the user should see the text "Você ainda não criou uma partida."