Feature: Login
  The user wants to login in the application

  Scenario Outline: User login successfull
    Given that the user is on the login page
    And user exists
    When the user fills in the "email" field with "<email>"
    And the user fills in the "password" field with "<password>"
    And the user click on "Submit"
    Then the user should be redirected to the matches page

  Scenario Outline: User login error - incorrect email or password
    Given that the user is on the login page
    And user exists
    When the user fills in the "email" field with "<email>"
    And the user fills in the "password" field with "<password>"
    And the user click on "Submit"
    Then user must be kept on login page
    And the user see the message "Email ou senha incorretos"

  Scenario Outline: User login error - fields are empty
    Given that the user is on the login page
    When the user fills in the "email" field with "<email>"
    And the user fills in the "password" field with "<password>"
    And the user click on "Submit"
    Then user must be kept on login page 
    And the user see the message "Informe o email"
    And the user see the message "Informe a senha"
