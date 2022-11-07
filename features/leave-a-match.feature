@loginAsUser
Feature: Button in the match page that allows the user to leave the match
    If the user want to leave a match, he just need to hit on the button "Sair da Partida"

    Scenario Outline: User exited successfully
        Given the user is in the page's match that he is already participating
        When the user click on the button "Sair da Partida"        
        Then the user should not see their name appearing in the match participant list

    Scenario Outline: User try to leave a match that he was not participating
        Given the user is in the page's match that he is not participating     
        Then the user should not see the button "Sair da Partida"
        And the user should not see their name appearing in the match participant list