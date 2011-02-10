Feature: User Registers
  In order to provide account details
  As a user on the register page
  I want to register an account

  - An input for email is visible (required)
  - An input for email confirmation is visible (required)
  - An input for password is visible (required)
  - An input for password confirmation is visible (required)
  - A "Save" button is visible
  - Clicking "Save" creates a new user in the system
  - Validation errors are visible if user cannot be created

  Scenario: empty form submission
    Given I am on the register page
    When I press "Save"
    Then I should see "Email can't be blank"
    And I should see "Email confirmation can't be blank"
    And I should see "Password can't be blank"
    And I should see "Password confirmation can't be blank"

  Scenario: form submission with errors
    Given I am on the register page
    When I fill in "Email" with "joe@mail.com"
    And I fill in "Email confirmation" with "me@mail.com"
    And I fill in "Password" with "welcome"
    And I fill in "Password confirmation" with "welco"
    And I press "Save"
    Then I should see "Email doesn't match confirmation"
    And I should see "Password doesn't match confirmation"

  Scenario: user already exists
    Given the following user:
      | email                 | tom@mail.com |
      | password              | welcome      |
      | password_confirmation | welcome      |
    And I am on the register page
    When I fill in "Email" with "tom@mail.com"
    And I fill in "Email confirmation" with "tom@mail.com"
    And I fill in "Password" with "tommy"
    And I fill in "Password confirmation" with "tommy"
    And I press "Save"
    Then I should see "Email has already been taken"

  Scenario: valid form submission
    Given I am on the register page
    When I fill in "Email" with "me@mail.com"
    And I fill in "Email confirmation" with "me@mail.com"
    And I fill in "Password" with "welcome"
    And I fill in "Password confirmation" with "welcome"
    And I press "Save"
    Then I should see "Registration successful"
