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

Scenario: Successful filtered Search
  Given the user opens the matches page
  When the user fills in the "search" field with "Rachão"
  And the user fills in the "date" field with "today"
  And the user fills in the "participant limit" field with "6"
  And the user fills in the "level" field with "Iniciante"
  And the user checks the checkbox for "half court"
  Then the user should see the text "Rachão da EACH"
  And the user should see the text "Rachão do ICMC"
  But the user should not see the text "Rachão do IME"