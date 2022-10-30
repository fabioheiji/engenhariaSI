@oneMatchBefore
@loginAsUser
Feature: User visits list of matches
  The user can view, enter and create new matches
  
  Scenario Outline: User see list of matches
    Given the user visits "/matches"
    Then the user must be a match table as follows
    |  name  |  description  |  address  |  privateCourt  |  limit  |  halfCourt  |  level  | 
    | <name> | <description> | <address> | <privateCourt> | <limit> | <halfCourt> | <level> |
    Examples:
    | name           | description                           | address                                                                      | privateCourt | limit | halfCourt  | level      |
    | Rachao da EACH | Rachao entre alunos da Each           | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000     | 1            | 10    | 1          | livre      |
  
  Scenario Outline: User want to see specific match
    Given the user visits "/matches"
    When when the user clicks see, on the first element of the table
    Then the user see the match details page

  Scenario Outline: User wants to create a new match
    Given the user visits "/matches"
    When the user click on "Criar nova partida"
    Then the user should be in "/matches/new"
