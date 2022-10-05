Feature: Sign up
    The user wants to register in the application

        Scenario Outline: User registration successful
            Given that the user is on the registration page
            When the user fills in the 'Nome' field with "<name>"
            When the user fills in the 'Email' field with "<email>"
            When the user fills in the 'Senha' field with "<password>"
            When the user fills in the 'Confirmação de Senha' field with "<passwordConfirmation>"
            When the user fills in the 'Data de Nascimento' field with "<date>"
            When the user fills in the 'Posição' field with "<position>"
            And click save
            Then the user must be saved in the database
            And the user should be redirected to the login page

        Scenario Outline: Error user registration - no name
            Given that the user is on the registration page
            When the user fills in the 'Email' field with "<email>"
            When the user fills in the 'Senha' field with "<password>"
            When the user fills in the 'Confirmação de Senha' field with "<passwordConfirmation>"
            When the user fills in the 'Data de Nascimento' field with "<dateOfBirth>"
            When the user fills in the 'Posição' field with "<position>"
            And the user leaves the "Name" field empty
            And click save
            Then the user should see the error message "É obrigatório informar o nome!"

        Scenario Outline: Error user registration - no email
            Given that the user is on the registration page
            When the user fills in the 'Nome' field with "<name>"
            When the user fills in the 'Senha' field with "<password>"
            When the user fills in the 'Confirmação de Senha' field with "<passwordConfirmation>"
            When the user fills in the 'Data de Nascimento' field with "<dateOfBirth>"
            When the user fills in the 'Posição' field with "<position>"
            And the user leaves the "Email" field empty
            And click save
            Then the user should see the error message "É obrigatório informar o email!"

        Scenario Outline: Error user registration - no password
            Given that the user is on the registration page
            When the user fills in the 'Nome' field with "<name>"
            When the user fills in the 'Email' field with "<email>"
            When the user fills in the 'Confirmação de Senha' field with "<passwordConfirmation>"
            When the user fills in the 'Data de Nascimento' field with "<dateOfBirth>"
            When the user fills in the 'Posição' field with "<position>"
            And the user leaves the "Senha" field empty
            And click save
            Then the user should see the error message "É obrigatório informar a senha!"

        Scenario Outline: Error user registration - no password confirmation
            Given that the user is on the registration page
            When the user fills in the 'Nome' field with "<name>"
            When the user fills in the 'Email' field with "<email>"
            When the user fills in the 'Senha' field with "<password>"
            When the user fills in the 'Data de Nascimento' field with "<dateOfBirth>"
            When the user fills in the 'Posição' field with "<position>"
            And the user leaves the "Confirmação de Senha" field empty
            And click save
            Then the user should see the error message "É obrigatório informar a confirmação de senha!"

        Scenario Outline: Error user registration - no date of birth
            Given that the user is on the registration page
            When the user fills in the 'Nome' field with "<name>"
            When the user fills in the 'Email' field with "<email>"
            When the user fills in the 'Senha' field with "<password>"
            When the user fills in the 'Confirmação de Senha' field with "<passwordConfirmation>"
            When the user fills in the 'Posição' field with "<position>"
            And the user leaves the "Data de Nascimento" field empty
            And click save
            Then the user should see the error message "É obrigatório informar a data de nascimento!"

        Scenario Outline: Error user registration - invalid email
            Given that the user is on the registration page
            When the user fills in the 'Nome' field with "<name>"
            When the user fills in the 'Senha' field with "<password>"
            When the user fills in the 'Confirmação de Senha' field with "<passwordConfirmation>"
            When the user fills in the 'Data de Nascimento' field with "<date>"
            When the user fills in the 'Posição' field with "<position>"
            And the user fills in the field "Email" com "a!1ç....,,,´/ ? @a"
            And click save
            Then the user should see the error message "Formato de email inválido!"

        Scenario Outline: Error user registration - existing email
            Given that the user is on the registration page
            When the user fills in the 'Nome' field with "<name>"
            When the user fills in the 'Senha' field with "<password>"
            When the user fills in the 'Confirmação de Senha' field with "<passwordConfirmation>"
            When the user fills in the 'Data de Nascimento' field with "<date>"
            When the user fills in the 'Posição' field with "<position>"
            And the user fills in the field "Email" com "<existing@mail.com>"
            And click save
            Then the user should see the error message "Já existe um usuário com o email fornecido!"

        Scenario Outline: Error user registration - different password and password confirmation
            Given that the user is on the registration page
            When the user fills in the 'Nome' field with "<name>"
            When the user fills in the 'Email' field with "<email>"
            When the user fills in the 'Senha' field with "<password>"
            When the user fills in the 'Data de Nascimento' field with "<date>"
            When the user fills in the 'Posição' field with "<position>"
            And the user fills in the field "Confirmação de Senha" com "<differentFromPassword>"
            And click save
            Then the user should see the error message "A senha e confirmação de senha são diferentes!"