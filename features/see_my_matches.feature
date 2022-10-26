@loginAsUser
Feature: See my matches

Scenario: See all my matches
  Given I have created matches
  And I click on 'My matches'
  Then I should see all my matches
  But not matches created by anyone else

Scenario: There are no matches created by me
  Given I click on 'My matches'
  Then I should be told "You have not created any matches yet."