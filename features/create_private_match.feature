@loginAsUser
Feature: User creates a private match in the app
    The user fills in a form with the match details and toggle on the private match option in order to just participants that have the match password are able to join in.

    Scenario Outline: Successful private match registration
        Given the user visits "/matches/new"
        When the user fills in the "match_name" field with "<name>"
        When the user fills in the "match_description" field with "<description>"
        When the user fills in the "match_address" field with "<address>"
        When the user click on the "match_privateCourt" field selecting the checkbox to "<privateCourt>"
        When the user fills in the "match_limit" field with "<limit>"
        When the user click on the "match_halfCourt" field selecting the checkbox to "<halfCourt>"
        When the user selects in the "match_level" field with "<level>"
        When the user fills in the "match_starts_at" field with "<starts_at>"
        When the user click on the "match_privateMatch" field selecting the checkbox to "<privateMatch>"
        When the user fills in the "match_privateMatchPassword" field with "<privateMatchPassword>"
        When the user click on "Salvar"
        Then the data must have been saved in the database and "<name>", "<description>", "<address>", "<privateCourt>", "<limit>", "<halfCourt>", "<level>", "<starts_at>" should be the last instance 
        And the user should see the text "<name>"
        And the user should see the text "<description>"

    Examples:
        | name              | description                           | address                                                                      | privateCourt | limit | halfCourt  | level      | starts_at         | privateMatch         | privateMatchPassword | wrong_password |
        | Rachao da EACH 2  | Rachao entre alunos da Each           | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000     | 1            | 20    | 1          | Livre      | 2022-10-30T09:00  | 1                    | 12345                | 11111          |
        | Rachao da EACH 2  | Rachao entre alunos da Each           | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000     | 1            | 20    | 1          | Livre      | 2022-10-30T09:00  | 1                    | 12345                |                |        
    
    Scenario Outline: Successful private match access with the right password
        Given the user is in the match name "<name>", description "<description>", address "<address>", privateCourt "<privateCourt>", limit "<limit>", halfCourt "<halfCourt>", level "<level>", starts_at "<starts_at>", privateMatch "<privateMatch>", privateMatchPassword "<privateMatchPassword>"
        Then the user should see the text "Partida privada"
        And the user should see the text "<description>"
        And the user should see the text "Senha para partida privada"
        But the user should not see the text "<address>"
        And the user should not see the text "<limit>"
        And the user should not see the text "<halfCourt>"
        And the user should not see the text "<level>"
        And the user should not see the text "<starts_at>"

        When the user fills in the "participate_in_match_privateMatchPassword" field with "<privateMatchPassword>"
        And the user click on the button "Participar"
        Then the user should see the text "<name>"
        And the user should see the text "<description>"
        And the user should see the text "<address>"
        And the user should see the text "<limit>"
        And the user should see the text "<halfCourt>"
        And the user should see the text "<level>"
        And the user name should be listed in the match's participants list

    Examples:
        | name              | description                           | address                                                                      | privateCourt | limit | halfCourt  | level      | starts_at         | privateMatch         | privateMatchPassword | wrong_password |
        | Rachao da EACH 2  | Rachao entre alunos da Each           | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000     | 1            | 20    | 1          | Livre      | 2022-10-30T09:00  | 1                    | 12345                | 11111          |
        | Rachao da EACH 2  | Rachao entre alunos da Each           | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000     | 1            | 20    | 1          | Livre      | 2022-10-30T09:00  | 1                    | 12345                |                |

    Scenario Outline: unsuccessful private match access with the wrong password
        Given the user is in the match name "<name>", description "<description>", address "<address>", privateCourt "<privateCourt>", limit "<limit>", halfCourt "<halfCourt>", level "<level>", starts_at "<starts_at>", privateMatch "<privateMatch>", privateMatchPassword "<privateMatchPassword>"
        Then the user should see the text "Partida privada"
        And the user should see the text "<description>"
        And the user should see the text "Senha para partida privada"
        But the user should not see the text "<address>"
        And the user should not see the text "<limit>"
        And the user should not see the text "<halfCourt>"
        And the user should not see the text "<level>"
        And the user should not see the text "<starts_at>"

        When the user fills in the "participate_in_match_privateMatchPassword" field with "<wrong_password>"
        And the user click on the button "Participar"
        Then the user should see the text "Senha incorreta! Tente novamente."
        But the user should not see the text "<address>"
        And the user should not see the text "<limit>"
        And the user should not see the text "<halfCourt>"
        And the user should not see the text "<level>"
        And the user should not see the text "<starts_at>"

    Examples:
        | name              | description                           | address                                                                      | privateCourt | limit | halfCourt  | level      | starts_at         | privateMatch         | privateMatchPassword | wrong_password |
        | Rachao da EACH 2  | Rachao entre alunos da Each           | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000     | 1            | 20    | 1          | Livre      | 2022-10-30T09:00  | 1                    | 12345                | 11111          |
        | Rachao da EACH 2  | Rachao entre alunos da Each           | Rua Arlindo Béttio, 1000 - Ermelino Matarazzo, São Paulo - SP, 03828-000     | 1            | 20    | 1          | Livre      | 2022-10-30T09:00  | 1                    | 12345                |                |


        