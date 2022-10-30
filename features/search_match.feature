@loginAsUser
Feature: Search matches

Scenario: See all matches
  Given I open the matches page
  Then I should see all matches

Scenario: Successful Search
  Given I open the matches page
  When the user fills in the "search" field with "EACH"
  And the user click on "Search"
  Then the user should see the text "Rachão da EACH"
  But the user should not see the text "Rachão do ICMC"
  And the user should not see the text "Rachão do IME"

Scenario: Empty Search Results
  Given I open the matches page
  When the user fills in the "search" field with "Bulbasaur" 
  And the user click on "Search"
  Then the user should see the text "Match(es) not found."