Feature: User creates a match in the app
  The user fills in a form with the match details and makes it available for other users to participate

    Scenario Outline: Successful match registration
        Given the user is in the page's match registration
        When the user fills in the 'match_name' field with "<name>"
        When the user fills in the 'match_description' field with "<description>"
        When the user fills in the 'match_address' field with "<address>"
        When the user click on the 'match_privateCourt' field selecting the checkbox to "<privateCourt>"
        When the user fills in the 'match_limit' field with "<limit>"
        When the user click on the 'match_halfCourt' field selecting the checkbox to "<halfCourt>"
        When the user fills in the 'match_level' field with "<level>"
        When the user click on save
        Then the data must have been saved in the database and "<name>", "<description>", "<address>", "<privateCourt>", "<limit>", "<halfCourt>", "<level>" should be the last instance 
        Then all the data should habe been saved in the BD AND the user should see the "<name>", "<description>", "<address>", "<privateCourt>", "<limit>", "<halfCourt>", "<level>" created

    Examples:
        | name           | description                           | address                                                                      | privateCourt | limit | halfCourt  | level      |
        | Rachao da EACH | Rachao entre alunos da Each           | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000     | 1            | 20    | 1          | livre      |
        | Rachao da Poli | Rachao entre alunos da Poli no CP USP | Prç. Prof. Rubião Meira, 61 - Vila Universitaria, São Paulo - SP, 05508-110  | 0            | 25    | 0          | Iniciante  |