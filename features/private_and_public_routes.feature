Feature: Private and public routes
  The user wants to access and handle some private resource

  Scenario: User not logged in
    Given that the user is not logged in
    Then the user should see the text "Home"
    Then the user should see the text "Login"
    Then the user should see the text "Sign up"
    When the user visits "/matches"
    When the user visits "/matches/new"
    Then the user should be in "/login"
    And the user should see the text "You must be logged in to access this section"
  
  Scenario: User logged in
    Given that the user is logged in
    Then the user should see the text "Home"
    Then the user should see the text "Matches"
    Then the user should see the text "Create match"
    Then the user should see the text "Log out"
    When the user visits "/matches"
    When the user visits "/matches/new"
    Then the user should be in "/matches/new"
  
  