Feature: User resets password
  In order to recover a forgotten password
  As a user attempting to sign in
  I want to reset my password

  - A link for "Forgot password" is visible
  - Clicking link takes me to the reset password page
  - An input for "Email" is visible (required)
  - A "Reset Password" button is visible
  - After entering an email and clicking "Submit":
    - I receive an email
    - I am sent to the sign in page and I see a flash notice that my email was sent
  - Email contains a link to the password reset page
  - Clicking link in email takes me to the password reset page
  - Reset password token is valid for a maximum of two hours
  - If reset token is expired, I should see a flash alert that token is expired
  - An input for "Password" is visibile
  - An input for "Password confirmation" is visible
  - An input for "Change Password" is visible
  - Entering matching passwords and clicking "Update Password":
    - I am on the sign in page
    - I see a flash notice that my password has been reset

  Background:
    Given the following user:
      | email                 | tom.jones@mail.com |
      | password              | welcome            |
      | password_confirmation | welcome            |
    And I am on the sign in page
    When I follow "Forgot password"
    Then I should be on the new password reset page

  Scenario: error on blank email
    When I fill in "Email" with ""
    And I press "Reset Password"
    Then I should be on the new password reset page
    And I should see "You must provide an email"

  Scenario: nonexistent email should have same UX
    When I fill in "Email" with "sam.adams@mail.com"
    And I press "Reset Password"
    Then I should be on the sign in page
    And I should see "An email was just sent to you with password reset instructions"

  Scenario: success
    When I fill in "Email" with "tom.jones@mail.com"
    And I press "Reset Password"
    Then I should be on the sign in page
    And I should see "An email was just sent to you with password reset instructions"
    And "tom.jones@mail.com" should receive an email
    When I open the email
    And I click the first link in the email
    Then I should see "Change Password"
    When I fill in "Password" with ""
    And I fill in "Password confirmation" with ""
    And I press "Change Password"
    Then I should see "Password confirmation can't be blank"
    When I fill in "Password" with "newsecret"
    And I fill in "Password confirmation" with "newsecret"
    And I press "Change Password"
    Then I should be on the sign in page
    And I should see "Your password was successfully changed"

  Scenario: expired password reset token
    When I fill in "Email" with "tom.jones@mail.com"
    And I press "Reset Password"
    Then I should be on the sign in page
    And I should see "An email was just sent to you with password reset instructions"
    And "tom.jones@mail.com" should receive an email
    And I let my password token expire
    When I open the email
    And I click the first link in the email
    Then I should see "Change Password"
    When I fill in "Password" with "newsecret"
    And I fill in "Password confirmation" with "newsecret"
    And I press "Change Password"
    Then I should be on the new password reset page
    And I should see "Password reset has expired"
