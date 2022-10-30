Feature: Login
  The user wants to login in the application

  Scenario Outline: User login successfull
    Given the user visits "/login"
    And following user exists
    | name   | email   | password   | password_confirmation   | birth_date   | position  | 
    | <name> | <email> | <password> | <password_confirmation> | <birth_date> | <position> |
    When the user fills in the "session_email" field with "<email>"
    And the user fills in the "session_password" field with "<password>"
    And the user click on "Confirmar"
    Then the user should be in "/matches"
    And the user should see the text "Entrou com sucesso"
    Examples:
    | name   | email            | password | password_confirmation | birth_date  | position | 
    | Fulano | fulano@gmail.com | 12345    | 12345                 | 01/01/2001  | PF       |
  
  Scenario Outline: User login error - incorrect email or password
    Given the user visits "/login"
    And following user exists
    | name   | email   | password   | password_confirmation   | birth_date   | position  | 
    | <name> | <email> | <password> | <password_confirmation> | <birth_date> | <position> |
    When the user fills in the "session_email" field with "<email>"
    And the user fills in the "session_password" field with "<incorrect_password>"
    And the user click on "Confirmar"
    Then the user should be in "/login"
    And the user should see the text "Incorrect email or password"
    Examples:
    | name   | email            | password | password_confirmation | birth_date  | position | incorrect_password |
    | Fulano | fulano@gmail.com | 12345    | 12345                 | 01/01/2001  | PF       | xxxxxxxxx          |