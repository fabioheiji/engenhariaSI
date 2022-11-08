Feature: Private and public routes
  The user wants to access and handle some private resource

  Scenario: User not logged in
    Given that the user is not logged in
    Then the user should see the text "BigHash"
    Then the user should see the text "Entrar"
    Then the user should see the text "Cadastrar"
    When the user visits "/matches"
    When the user visits "/matches/new"
    Then the user should be in "/login"
    And the user should see the text "Você deve estar logado para acessar esta seção!"
  
  Scenario: User logged in
    Given that the user is logged in
    Then the user should see the text "BigHash"
    Then the user should see the text "Partidas"
    Then the user should see the text "Criar partida"
    Then the user should see the text "Sair"
    When the user visits "/matches"
    When the user visits "/matches/new"
    Then the user should be in "/matches/new"
  
  