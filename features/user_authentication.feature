Feature: Users should join and login
  In order to grow participation
  A User
  Should be able to login to the site

  Scenario: I join the service
    Given I'm a visitor
    When I join
    Then I should be welcomed

  Scenario: I can log in
    Given I'm an existing user
    When I login
    Then I should see a success message

  Scenario: I can log out
    Given I'm logged in
    When I logout
    Then I should see a success message

  Scenario: I need to reset my password
    Given I'm an existing user
    When I request a password reset
    Then I should reset my password

  Scenario: I got locked out
    Given I'm an existing user
    When I get locked out
    Then I should unlock myself

  Scenario: I didn't receive unlock instructions
    Given I'm locked out
    When I request unlock instructions
    Then I should unlock myself
