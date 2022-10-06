Feature: Sign up
    The user wants to register in the application

        Scenario: User registration successful
            Given that the user is on the registration page
            When the user fills in the 'Name' field with "Wallace Ramon"
            When the user fills in the 'Email' field with "Wallaceramonns@usp.br"
            When the user fills in the 'Password' field with "123456"
            When the user fills in the 'Password confirmation' field with "123456"
            When the user fills in the 'Birth date' field with "14/10/1999"
            When the user fills in the 'Position' field with "Power Forward"
            And click save
            Then the user must be saved in the database
            And the user should be redirected to the login page

        Scenario: Error user registration - no name
            Given that the user is on the registration page
            When the user fills in the 'Email' field with "Wallaceramonns@usp.br"
            When the user fills in the 'Password' field with "123456"
            When the user fills in the 'Password confirmation' field with "123456"
            When the user fills in the 'Birth date' field with "14/10/1999"
            When the user fills in the 'Position' field with "Power Forward"
            And the user leaves the "Name" field empty
            And click save
            Then the user should see the error message "É obrigatório informar o nome!"

        Scenario: Error user registration - no email
            Given that the user is on the registration page
            When the user fills in the 'Name' field with "Wallace Ramon"
            When the user fills in the 'Password' field with "123456"
            When the user fills in the 'Password confirmation' field with "123456"
            When the user fills in the 'Birth' field with "14/10/1999"
            When the user fills in the 'Position' field with "Power Forward"
            And the user leaves the "Email" field empty
            And click save
            Then the user should see the error message "É obrigatório informar o email!"

        Scenario: Error user registration - no password
            Given that the user is on the registration page
            When the user fills in the 'Name' field with "Wallace Ramon"
            When the user fills in the 'Email' field with "Wallaceramonns@usp.br"
            When the user fills in the 'Password confirmation' field with "123456"
            When the user fills in the 'Birth' field with "14/10/1999"
            When the user fills in the 'Position' field with "Power Forward"
            And the user leaves the "Password" field empty
            And click save
            Then the user should see the error message "É obrigatório informar a senha!"

        Scenario: Error user registration - no password confirmation
            Given that the user is on the registration page
            When the user fills in the 'Name' field with "Wallace Ramon"
            When the user fills in the 'Email' field with "Wallaceramonns@usp.br"
            When the user fills in the 'Password' field with "123456"
            When the user fills in the 'Birth' field with "14/10/1999"
            When the user fills in the 'Position' field with "Power Forward"
            And the user leaves the "Password Confirmation" field empty
            And click save
            Then the user should see the error message "É obrigatório informar a confirmação de senha!"

        Scenario: Error user registration - no date of birth
            Given that the user is on the registration page
            When the user fills in the 'Name' field with "Wallace Ramon"
            When the user fills in the 'Email' field with "Wallaceramonns@usp.br"
            When the user fills in the 'Password' field with "123456"
            When the user fills in the 'Password confirmation' field with "123456"
            When the user fills in the 'Position' field with "Power Forward"
            And the user leaves the "Birth" field empty
            And click save
            Then the user should see the error message "É obrigatório informar a data de nascimento!"

        Scenario: Error user registration - invalid email
            Given that the user is on the registration page
            When the user fills in the 'Name' field with "Wallace Ramon"
            When the user fills in the 'Password' field with "123456"
            When the user fills in the 'Password confirmation' field with "123456"
            When the user fills in the 'Birth date' field with "14/10/1999"
            When the user fills in the 'Position' field with "Power Forward"
            And the user fills in the field "Email" com "a!1ç....,,,´/ ? @a"
            And click save
            Then the user should see the error message "Formato de email inválido!"

        Scenario: Error user registration - existing email
            Given that the user is on the registration page
            When the user fills in the 'Name' field with "Wallace Ramon"
            When the user fills in the 'Password' field with "123456"
            When the user fills in the 'Password confirmation' field with "123456"
            When the user fills in the 'Birth date' field with "14/10/1999"
            When the user fills in the 'Position' field with "Power Forward"
            And the user fills in the field "Email" com "<existing@mail.com>"
            And click save
            Then the user should see the error message "Já existe um usuário com o email fornecido!"

        Scenario: Error user registration - different password and password confirmation
            Given that the user is on the registration page
            When the user fills in the 'Name' field with "Wallace Ramon"
            When the user fills in the 'Email' field with "Wallaceramonns@usp.br"
            When the user fills in the 'Password' field with "123456"
            When the user fills in the 'Birth date' field with "<birth date>"
            When the user fills in the 'Position' field with "Power Forward"
            And the user fills in the field "Password confirmation" com "<differentFromPassword>"
            And click save
            Then the user should see the error message "A senha e confirmação de senha são diferentes!"