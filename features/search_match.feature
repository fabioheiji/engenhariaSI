@loginAsUser
Feature: Search matches

  Scenario: See all matches
    Given the user opens the matches page
    Then the user should see all matches

  Scenario: Empty Search Results
    Given the user opens the matches page
    When the user fills in the "search" field with "Bulbasaur" 
    And the user clicks on "Pesquisar"
    Then the user should see the text "Não foram encontradas partidas com esse nome ou endereço."

  Scenario: Successful Search
    Given the user opens the matches page
    When the user fills in the "search" field with "EACH"
    And the user clicks on "Pesquisar"
    Then the user should see the text "Rachão da EACH"
    But the user should not see the text "Rachão do ICMC"
    And the user should not see the text "Rachão do IME"

  Scenario: Successful search - case insensitive
    Given the user opens the matches page
    When the user fills in the "search" field with "usp leste"
    And the user clicks on "Pesquisar"
    Then the user should see the text "Rachão da EACH"

  Scenario: Successful filtered search - from a certain date
    Given the user opens the matches page
    And the user fills in the "starts_at" field with "2021-11-05T15:00"
    And the user clicks on "Pesquisar"
    Then the user should see the text "Rachão do IME"
    And the user should see the text "Rachão do ICMC"
    But the user should not see the text "Rachão da EACH"

  Scenario: Successful filtered search - by half court (true)
    Given the user opens the matches page
    When the user checks the "radio button" for "half_court_true"
    And the user clicks on "Pesquisar"
    Then the user should see the text "Rachão do ICMC"
    But the user should not see the text "Rachão da EACH"
    And the user should not see the text "Rachão do IME"
    
  Scenario: Successful filtered search - by half court (false)
    Given the user opens the matches page
    When the user checks the "radio button" for "half_court_false"
    And the user clicks on "Pesquisar"
    Then the user should see the text "Rachão da EACH"
    And the user should see the text "Rachão do IME"
    But the user should not see the text "Rachão do ICMC"
    
  Scenario: Successful filtered search - by paticipant limit
    Given the user opens the matches page
    When the user fills in the "limit" field with "15"
    And the user clicks on "Pesquisar"
    Then the user should see the text "Rachão da EACH"
    But the user should not see the text "Rachão do IME"
    And the user should not see the text "Rachão do ICMC"
 
  Scenario: Successful filtered search - by level
    Given the user opens the matches page
    When the user selects in the "level" field with "Iniciante"
    And the user clicks on "Pesquisar"
    Then the user should see the text "Rachão do IME"
    And the user should see the text "Rachão do ICMC"
    But the user should not see the text "Rachão da EACH"