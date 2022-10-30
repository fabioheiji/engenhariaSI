Feature: User chooses to participate in a specific match in the app
  The user click on a specific button to participate in a specific match

    Scenario Outline: Successful join in a match
      Given the user is in the page's list of matches in after search for a match
      When the user click on the match "Ibirapuera"
      When the user click on the button "Participar"        
      Then the user name should be listed in the match's participants list