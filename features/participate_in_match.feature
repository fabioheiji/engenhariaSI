@loginAsUser
@oneMatchBefore
Feature: User chooses to participate in a specific match in the app
  The user click on a specific button to participate in a specific match

    Scenario: Successful join in a match
      Given the user visits last created match
      When the user click on "Participar"        
      Then the user should see the text "LeBron James - Small Forward (SF)"

    Scenario: It is not possible to join the game as it is full
      Given a newly created match with the maximum number of participants reached
      And the user visits last created match
      Then the user should see the text "Não é possível entrar nesta sala. O limite de participantes foi atingido!"
    