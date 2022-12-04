@oneMatchBefore
@loginAsUser
Feature: A map should be displayed in every match's page view with the right location
    Each match should render a map pointing to the registered address

    Scenario Outline: Successful map rendering
        Given the user visits an existing room
        Then the user should see a map
    Scenario Outline: Unccessful map rendering
        Given the user visits an existing room with wrong address
        Then the user should not see a map    
    
