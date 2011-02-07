Feature: User signs out
  In order to end my session
  As an authenticated user
  I want to sign out

  - Sign out link is visible
  - Clicking the link ends my session
  - System takes me to the sign in screen

  Scenario: user signs out
    Given I am signed in
    When I follow "Sign out"
    Then I should see "Successfully signed out"
    And I should be on the sign in page
