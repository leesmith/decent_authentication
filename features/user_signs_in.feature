Feature: User signs in
  In order to prevent unauthorized users from accessing content
  As a user attempting to view any page
  I want to sign in

  - An input to provide an email address is visible
  - An input to provide a password is visible
  - A sign in button is visible
  - Clicking button authorizes me
  - System takes me to the home page

  Scenario: empty sign in form submission
    Given I am on the sign in page
    And I press "Sign in"
    Then I should see "Invalid sign in attempt"

  Scenario: invalid credentials
    Given the following user:
      | email                 | tom@mail.com |
      | password              | welcome      |
      | password_confirmation | welcome      |
    And I am on the sign in page
    When I fill in "Email" with "joe@mail.com"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Invalid sign in attempt"

  Scenario: valid sign in attempt
    Given I am signed in
    Then I should see "Sign out"
    And I should be on the home page
