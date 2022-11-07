@loginAsUser
@oneMatchBefore
Feature: User chooses to participate in a specific match in the app
  The user click on a specific button to participate in a specific match

    Scenario Outline: Successful join in a match
      Given the user visits last created match
      When the user click on "Participar"        
      Then the user should see the text "LeBron James - Small Forward (SF)"