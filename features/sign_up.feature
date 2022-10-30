Feature: Sign up
    The user wants to register in the application

        Scenario: User registration successful
            Given the user visits "/signup"
            When the user fills in the "user_name" field with "Wallace Ramon"
            When the user fills in the "user_email" field with "Wallaceramonns@usp.br"
            When the user fills in the "user_password" field with "123456"
            When the user fills in the "user_password_confirmation" field with "123456"
            When the user fills in the "user_birth_date" field with "14/10/1999"
            When the user fills in the "user_position" field with "Power Forward"
            And the user click on "Salvar"
            Then the user must be saved in the database
            And the user should be in "/login"

        Scenario: Error user registration - without name
            Given the user visits "/signup"
            When the user fills in the "user_email" field with "Wallaceramonns@usp.br"
            When the user fills in the "user_password" field with "123456"
            When the user fills in the "user_password_confirmation" field with "123456"
            When the user fills in the "user_birth_date" field with "14/10/1999"
            When the user fills in the "user_position" field with "Power Forward"
            And the user fills in the "user_name" field with ""
            And the user click on "Salvar"
            Then the user should see the text "É obrigatório informar o nome!"

        Scenario: Error user registration - without email
            Given the user visits "/signup"
            When the user fills in the "user_name" field with "Wallace Ramon"
            When the user fills in the "user_password" field with "123456"
            When the user fills in the "user_password_confirmation" field with "123456"
            When the user fills in the "user_birth_date" field with "14/10/1999"
            When the user fills in the "user_position" field with "Power Forward"
            And the user fills in the "user_email" field with ""
            And the user click on "Salvar"
            Then the user should see the text "É obrigatório informar o email!"

        Scenario: Error user registration - without password
            Given the user visits "/signup"
            When the user fills in the "user_name" field with "Wallace Ramon"
            When the user fills in the "user_email" field with "Wallaceramonns@usp.br"
            When the user fills in the "user_password_confirmation" field with "123456"
            When the user fills in the "user_birth_date" field with "14/10/1999"
            When the user fills in the "user_position" field with "Power Forward"
            And the user fills in the "user_password" field with ""
            And the user click on "Salvar"
            Then the user should see the text "É obrigatório informar a senha!"

        Scenario: Error user registration - without password confirmation
            Given the user visits "/signup"
            When the user fills in the "user_name" field with "Wallace Ramon"
            When the user fills in the "user_email" field with "Wallaceramonns@usp.br"
            When the user fills in the "user_password" field with "123456"
            When the user fills in the "user_birth_date" field with "14/10/1999"
            When the user fills in the "user_position" field with "Power Forward"
            And the user fills in the "user_password_confirmation" field with ""
            And the user click on "Salvar"
            Then the user should see the text "É obrigatório informar a confirmação de senha!"

        Scenario: Error user registration - without birth date
            Given the user visits "/signup"
            When the user fills in the "user_name" field with "Wallace Ramon"
            When the user fills in the "user_email" field with "Wallaceramonns@usp.br"
            When the user fills in the "user_password" field with "123456"
            When the user fills in the "user_password_confirmation" field with "123456"
            When the user fills in the "user_position" field with "Power Forward"
            And the user fills in the "user_birth_date" field with ""
            And the user click on "Salvar"
            Then the user should see the text "É obrigatório informar a data de nascimento!"

        Scenario: Error user registration - invalid email
            Given the user visits "/signup"
            When the user fills in the "user_name" field with "Wallace Ramon"
            When the user fills in the "user_password" field with "123456"
            When the user fills in the "user_password_confirmation" field with "123456"
            When the user fills in the "user_birth_date" field with "14/10/1999"
            When the user fills in the "user_position" field with "Power Forward"
            And the user fills in the "user_email" field with "a!1ç....,,,´/ ? @a"
            And the user click on "Salvar"
            Then the user should see the text "Formato de e-mail inválido!"

        Scenario: Error user registration - different password and Confirmação da senha
            Given the user visits "/signup"
            When the user fills in the "user_name" field with "Wallace Ramon"
            When the user fills in the "user_email" field with "Wallaceramonns@usp.br"
            When the user fills in the "user_password" field with "123456"
            When the user fills in the "user_birth_date" field with "<Data de nascimento>"
            When the user fills in the "user_position" field with "Power Forward"
            And the user fills in the "user_password_confirmation" field with "<differentFromPassword>"
            And the user click on "Salvar"
            Then the user should see the text "A senha e confirmação de senha são diferentes!"