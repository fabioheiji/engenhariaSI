Feature: User creates a match in the app
  The user fills in a form with the match details and makes it available for other users to participate

    Scenario Outline: Successful match registration
        Given the user is in the page's match registration
        When the user fills in the 'Nome' field with "<name>"
        When the user fills in the 'Descrição' field with "<description>"
        When the user fills in the 'Endereço' field with "<address>"
        When the user fills in the 'Privado' field with "<private>"
        When the user fills in the 'Limite de participantes' field with "<limit>"
        When the user fills in the 'Meia quadra' field with "<half_quort>"
        When the user fills in the 'Nivel' field with "<level>"
        When the user click on save
        Then all the data should habe been saved in the BD AND the user should see the match in your list os matches created

    Examples:
        | name           | description                           | address                                                                      | private | limit | half_quort | level      |
        | Rachao da EACH | Rachao entre alunos da Each           | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000     | True    | 20    | True       | livre      |
        | Rachao da Poli | Rachao entre alunos da Poli no CP USP | Prç. Prof. Rubião Meira, 61 - Vila Universitaria, São Paulo - SP, 05508-110  | False   | 25    | False      | Iniciante  |