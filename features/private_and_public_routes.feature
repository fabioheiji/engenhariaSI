Feature: Private and public routes
  The user wants to access and handle some private resource

  Scenario: User not logged in
    Given that the user is not logged in
    Then the user should see the link for 'BigHash' in the header
    Then the user should see the link for 'Login' in the header
    Then the user should see the link for 'Sign up' in the header
    When the user tries to access the link '/matches'
    When the user tries to access the link '/matches/new'
    Then the user should be redirected to login page
    And the user see the message "You must be logged in to access this section"
  
  Scenario: User logged in
    Given that the user is logged in
    Then the user should see the link for 'BigHash' in the header
    Then the user should see the link for 'View Matches' in the header
    Then the user should see the link for 'Create match' in the header
    Then the user should see the link for 'Log out' in the header
    When the user tries to access the link '/matches'
    When the user tries to access the link '/matches/new'
    Then the user should be redirected to the desired page
  
  