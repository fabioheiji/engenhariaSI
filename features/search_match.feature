@loginAsUser
Feature: Search matches

Scenario: See all matches
  Given the user opens the matches page
  Then the user should see all matches

Scenario: Successful Search
  Given the user opens the matches page
  When the user fills in the "search" field with "EACH"
  And the user clicks on "Pesquisar"
  Then the user should see the text "Rachão da EACH"
  But the user should not see the text "Rachão do ICMC"
  And the user should not see the text "Rachão do IME"

Scenario: Empty Search Results
  Given the user opens the matches page
  When the user fills in the "search" field with "Bulbasaur" 
  And the user clicks on "Pesquisar"
  Then the user should see the text "Não foram encontradas partidas com esse nome ou endereço."