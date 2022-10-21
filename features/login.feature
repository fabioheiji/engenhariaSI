Feature: Login
  The user wants to login in the application

  Scenario Outline: User login successfull
    Given that the user is on the login page
    And following user exists
    | name   | email   | password   | password_confirmation   | birth_date   | position  | 
    | <name> | <email> | <password> | <password_confirmation> | <birth_date> | <position> |
    When the user fills in the "session_email" field with "<email>"
    And the user fills in the "session_password" field with "<password>"
    And the user click on "Submit"
    Then the user should be redirected to the matches page
    And the user see the message "Logged in successfully"
    Examples:
    | name   | email            | password | password_confirmation | birth_date  | position | 
    | Fulano | fulano@gmail.com | 12345    | 12345                 | 01/01/2001  | PF       |
  
  Scenario Outline: User login error - incorrect email or password
    Given that the user is on the login page
    And following user exists
    | name   | email   | password   | password_confirmation   | birth_date   | position  | 
    | <name> | <email> | <password> | <password_confirmation> | <birth_date> | <position> |
    When the user fills in the "session_email" field with "<email>"
    And the user fills in the "session_password" field with "<incorrect_password>"
    And the user click on "Submit"
    Then user must be kept on login page
    And the user see the message "Incorrect email or password"
    Examples:
    | name   | email            | password | password_confirmation | birth_date  | position | incorrect_password |
    | Fulano | fulano@gmail.com | 12345    | 12345                 | 01/01/2001  | PF       | xxxxxxxxx          |

  Scenario Outline: User login error - fields are empty
    Given that the user is on the login page
    When the user fills in the "session_email" field with "<email>"
    And the user fills in the "session_password" field with "<password>"
    And the user click on "Submit"
    Then user must be kept on login page 
    And the user see the message "Informe o email"
    And the user see the message "Informe a senha"
