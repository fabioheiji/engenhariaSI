#language: pt

Funcionalidade: Cadastro
    Como usuário
    Para que eu possa interagir com rachões ao meu redor
    Eu quero me cadastrar no sistema

        Cenário: Cadastro de usuário com sucesso
            Dado que estou na página de cadastro
            Quando preencho o campo "Nome" com "Wallace Ramon"
            Quando preencho o campo "Email" com "wallaceramonns@usp.br"
            Quando preencho o campo "Senha" com "123456"
            Quando preencho o campo "Confirmação de Senha" com "123456"
            Quando preencho o campo "Data de Nascimento" com "14/10/1999"
            Quando preencho o campo "Posição" com "Point Guard"
            E clico em salvar
            Então eu devo ter sido salvo no banco de dados
            E deverei ter acesso ao sistema a partir da página de login

        Cenário: Cadastro com erro - sem nome
            Dado que estou na página de cadastro
            Quando preencho o campo "Email" com "wallaceramonns@usp.br"
            Quando preencho o campo "Senha" com "123456"
            Quando preencho o campo "Confirmação de Senha" com "123456"
            Quando preencho o campo "Data de Nascimento" com "14/10/1999"
            Quando preencho o campo "Posição" com "Point Guard"
            E deixo o campo "Nome" vazio
            E clico em salvar
            Então deverei ver a mensagem de erro "É obrigatório informar o nome!"

        Cenário: Cadastro com erro - sem email
            Dado que estou na página de cadastro
            Quando preencho o campo "Nome" com "Wallace Ramon"
            Quando preencho o campo "Senha" com "123456"
            Quando preencho o campo "Confirmação de Senha" com "123456"
            Quando preencho o campo "Data de Nascimento" com "14/10/1999"
            Quando preencho o campo "Posição" com "Point Guard"
            E deixo o campo "Email" vazio
            E clico em salvar
            Então deverei ver a mensagem de erro "É obrigatório informar o email!"

        Cenário: Cadastro com erro - sem senha
            Dado que estou na página de cadastro
            Quando preencho o campo "Nome" com "Wallace Ramon"
            Quando preencho o campo "Email" com "wallaceramonns@usp.br"
            Quando preencho o campo "Confirmação de Senha" com "123456"
            Quando preencho o campo "Data de Nascimento" com "14/10/1999"
            Quando preencho o campo "Posição" com "Point Guard"
            E deixo o campo "Senha" vazio
            E clico em salvar
            Então deverei ver a mensagem de erro "É obrigatório informar a senha!"

        Cenário: Cadastro com erro - sem confirmação de senha
            Dado que estou na página de cadastro
            Quando preencho o campo "Nome" com "Wallace Ramon"
            Quando preencho o campo "Email" com "wallaceramonns@usp.br"
            Quando preencho o campo "Senha" com "123456"
            Quando preencho o campo "Data de Nascimento" com "14/10/1999"
            Quando preencho o campo "Posição" com "Point Guard"
            E deixo o campo "Confirmação de Senha" vazio
            E clico em salvar
            Então deverei ver a mensagem de erro "É obrigatório informar a confirmação de senha!"

        Cenário: Cadastro com erro - sem data de nascimento
            Dado que estou na página de cadastro
            Quando preencho o campo "Nome" com "Wallace Ramon"
            Quando preencho o campo "Email" com "wallaceramonns@usp.br"
            Quando preencho o campo "Senha" com "123456"
            Quando preencho o campo "Confirmação de Senha" com "123456"
            Quando preencho o campo "Posição" com "Point Guard"
            E deixo o campo "Data de Nascimento" vazio
            E clico em salvar
            Então deverei ver a mensagem de erro "É obrigatório informar a data de nascimento!"

        Cenário: Cadastro com erro - email inválido
            Dado que estou na página de cadastro
            Quando preencho o campo "Nome" com "Wallace Ramon"
            Quando preencho o campo "Senha" com "123456",
            Quando preencho o campo "Confirmação de Senha" com "123456"
            Quando preencho o campo "Data de Nascimento" com "14/10/1999"
            Quando preencho o campo "Posição" com "Point Guard"
            E preencho o campo "Email" com "a!1ç....,,,´/ ? @a"
            E clico em salvar
            Então deverei ver a mensagem de erro "Formato de email inválido!"

        Cenário: Cadastro com erro - email já existente
            Dado que estou na página de cadastro
            Quando preencho o campo "Nome" com "Wallace Ramon"
            Quando preencho o campo "Senha" com "123456"
            Quando preencho o campo "Confirmação de Senha" com "123456"
            Quando preencho o campo "Data de Nascimento" com "14/10/1999"
            Quando preencho o campo "Posição" com "Point Guard"
            E preencho o campo "Email" com "existente@usp.br"
            E clico em salvar
            Então deverei ver a mensagem de erro "Já existe um usuário com o email fornecido!"

        Cenário: Cadastro com erro - senha e confirmação de senha diferentes
            Dado que estou na página de cadastro
            Quando preencho o campo "Nome" com "Wallace Ramon"
            Quando preencho o campo "Email" com "wallaceramonns@usp.br"
            Quando preencho o campo "Senha" com "123456"
            Quando preencho o campo "Data de Nascimento" com "14/10/1999"
            Quando preencho o campo "Posição" com "Point Guard"
            E preencho o campo "Confirmação de Senha" com "12346"
            E clico em salvar
            Então deverei ver a mensagem de erro "A senha e confirmação de senha são diferentes!"