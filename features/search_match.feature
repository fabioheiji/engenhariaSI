@loginAsUser
Feature: Search matches

Scenario: See all matches
  Given I open the matches page
  Then I should see all matches

Scenario: Successful Search
  Given I open the matches page
  When I fill the "search" field with "EACH"
  And I click on "Search"
  Then I should see "Rachão da EACH"
  But not "Rachão do ICMC" or "Rachão do IME"

Scenario: Empty Search Results
  Given I open the matches page
  When I fill the "search" field with "Bulbasaur" 
  And I click on "Search"
  Then I should be told "Match(es) not found."