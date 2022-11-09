Feature: Delete match

@loginAsUser
Scenario: Delete match successfully
  Given the user has created matches  
  And the user visits '/users/:id'
  And the user clicks on "remove_0"
  Then the user should not see the match '#view-0' anymore

@loginAsUser
Scenario: Cannot delete a match from another user
  Given the user is seeing matches created by other users
  Then the user should not see the button 'Deletar partida'

Scenario: Cannot delete a match when not logged in
  Given the user is not logged in
  Then the user should not see the button 'Deletar partida'
