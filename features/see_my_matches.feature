@loginAsUser
Feature: See my matches

Scenario: See all my matches
  Given I have created matches
  And the user click on 'Minhas partidas'
  Then I should see all my matches
  But not matches created by anyone else

Scenario: There are no matches created by me
  Given the user click on 'Minhas partidas'
  Then the user should see the text "You have not created any matches yet."