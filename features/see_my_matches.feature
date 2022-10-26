@loginAsUser
Feature: See my matches

Scenario: See all my matches
  Given I have created matches
  When I go to my matches page
  Then I should see all my matches
  But not matches created by anyone else

Scenario: There are no matches created by me
  Given I have not created any matches yet 
  When I go to my matches page
  Then I should be told "You have not created any matches yet."