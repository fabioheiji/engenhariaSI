@loginAsUser
Feature: User creates a match in the app
  The user fills in a form with the match details and makes it available for other users to participate

    Scenario Outline: Successful match registration
        Given the user visits "/matches/new"
        When the user fills in the "match_name" field with "<name>"
        When the user fills in the "match_description" field with "<description>"
        When the user fills in the "match_address" field with "<address>"
        When the user clicks on the "match_privateCourt" field selecting the checkbox to "<privateCourt>"
        When the user fills in the "match_limit" field with "<limit>"
        When the user clicks on the "match_halfCourt" field selecting the checkbox to "<halfCourt>"
        When the user selects in the "match_level" field with "<level>"
        When the user fills in the "match_starts_at" field with "<starts_at>"
        When the user clicks on "Salvar"
        Then the data must have been saved in the database and "<name>", "<description>", "<address>", "<privateCourt>", "<limit>", "<halfCourt>", "<level>", "<starts_at>" should be the last instance 
        And the user should see the text "<name>"
        And the user should see the text "<description>"

    Examples:
        | name           | description                           | address                                                                      | privateCourt | limit | halfCourt  | level      | starts_at         |
        | Rachao da EACH | Rachao entre alunos da Each           | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000     | 1            | 20    | 1          | Livre      | 2023-10-30T09:00  |
        | Rachao da Poli | Rachao entre alunos da Poli no CP USP | Prç. Prof. Rubião Meira, 61 - Vila Universitaria, São Paulo - SP, 05508-110  | 0            | 15    | 0          | Iniciante  | 2023-11-05T15:00  |
