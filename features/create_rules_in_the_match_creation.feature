Feature: User try to create a match in the app but failed
  The user fills in a form with the match details and makes it available for other users to participate. In this case some fields should be mandatory.

    Scenario Outline: Error match registration
        Given the user is in the page's match registration - error registration
        When the user fills in the 'match_name' field with "<nameError>" - error registration
        When the user fills in the 'match_description' field with "<descriptionError>" - error registration
        When the user fills in the 'match_address' field with "<addressError>" - error registration
        When the user click on the 'match_privateCourt' field selecting the checkbox to "<privateCourtError>" - error registration
        When the user fills in the 'match_limit' field with "<limitError>" - error registration
        When the user click on the 'match_halfCourt' field selecting the checkbox to "<halfCourtError>" - error registration
        When the user fills in the 'match_level' field with "<levelError>" - error registration
        When the user click on save - error registration
        Then I should see the error message "<messageError>" - error registration

    Examples:
        | nameError           | descriptionError                           | addressError                                                                      | privateCourtError | limitError | halfCourtError  | levelError      | messageError                         |
        |                     | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 | 20         | 1               | livre           | É obrigatório informar o nome!       |
        | Rachao da EACH      |                                            | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 | 20         | 1               | livre           | É obrigatório informar a descrição!  |
        | Rachao da EACH      | Rachao entre alunos da Each                |                                                                                   | 1                 | 20         | 1               | livre           | É obrigatório informar o endereço!   |
        | Rachao da EACH      | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          |                   | 20         | 1               | livre           |                                      |
        | Rachao da EACH      | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 |            | 1               | livre           |                                      |
        | Rachao da EACH      | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 | 20         |                 | livre           |                                      |
        | Rachao da EACH      | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 | 20         | 1               |                 | É obrigatório informar o nível!      |