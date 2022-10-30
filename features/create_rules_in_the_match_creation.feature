@loginAsUser
Feature: User try to create a match in the app but failed
  The user fills in a form with the match details and makes it available for other users to participate. In this case some fields should be mandatory.

    Scenario Outline: Error match registration
        Given the user visits "/matches/new"
        When the user fills in the "match_name" field with "<nameError>"
        When the user fills in the "match_description" field with "<descriptionError>"
        When the user fills in the "match_address" field with "<addressError>"
        When the user click on the "match_privateCourt" field selecting the checkbox to "<privateCourtError>" - error registration
        When the user fills in the "match_limit" field with "<limitError>"
        When the user click on the "match_halfCourt" field selecting the checkbox to "<halfCourtError>" - error registration
        When the user fills in the "match_level" field with "<levelError>"
        When the user fills in the "match_starts_at" field with "<matchStartsAtError>"
        When the user click on "Salvar"
        Then the user should see the text "<messageError>"

    Examples:
        | nameError           | descriptionError                           | addressError                                                                      | privateCourtError | limitError | halfCourtError  | levelError      | matchStartsAtError | messageError                                       |
        |                     | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 | 20         | 1               | livre           | 2022-11-05T15:00   | É obrigatório informar o nome!                     |
        | Rachao da EACH      |                                            | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 | 20         | 1               | livre           | 2022-11-05T15:00   | É obrigatório informar a descrição!                |
        | Rachao da EACH      | Rachao entre alunos da Each                |                                                                                   | 1                 | 20         | 1               | livre           | 2022-11-05T15:00   | É obrigatório informar o endereço!                 |
        | Rachao da EACH      | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          |                   | 20         | 1               | livre           | 2022-11-05T15:00   |                                                    |
        | Rachao da EACH      | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 |            | 1               | livre           | 2022-11-05T15:00   |                                                    |
        | Rachao da EACH      | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 | 20         |                 | livre           | 2022-11-05T15:00   |                                                    |
        | Rachao da EACH      | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 | 20         | 1               |                 | 2022-11-05T15:00   | É obrigatório informar o nível!                    |
        | Rachao da EACH      | Rachao entre alunos da Each                | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000          | 1                 | 20         | 1               | livre           |                    | É obrigatório informar a data e horário de início! |