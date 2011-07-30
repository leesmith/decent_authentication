Feature: User session is remembered
  In order to make signing in more convenient
  As a user attempting to sign in
  I want my session to be remembered

  - A remember me checkbox is visible
  - Choosing remember me and signing in remembers my session

  Scenario: Remember me
    Given I am signed in with the remember me option
    Then I should be on the home page
    When I close my browser
    And I go to the home page
    Then I should be on the home page
    And I should see "Sign out"

  Scenario: Don't remember me
    Given I am signed in
    Then I should be on the home page
    When I close my browser
    And I go to the home page
    Then I should see "Please sign in before continuing"
