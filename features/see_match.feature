@oneMatchBefore
@loginAsUser
Feature: User visits specific match
  The user can see a specific match and its main information.

  Scenario: User successfully enters the match
    Given the user visits an existing room
    Then the user should see the text "Rachao da EACH"
    And the user should see the text "Rachao entre alunos da Each"
    And the user should see the text "Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000"
    And the user should see the text "10"
    And the user should see the text "true"
    And the user should see the text "true"
    And the user should see the text "Livre"
    And the user should see the text "2022-11-05 15:00:00 UTC"

  Scenario: User cannot enter the match - match does not exist
    Given the user visits a non-existing room
    Then the user should see the text "A página que você está procurando não existe."