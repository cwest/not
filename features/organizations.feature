Feature: Organizations can be managed
  In order to setup locations
  A user
  Should be able to manage organizations

  Scenario: I have no organizations
    Given I'm a new user
    When I view my organizations
    Then I should see no organizations

  Scenario: I create an organization
    Given I have no organizations
    When I create an organization
    Then I should see a success message

  Scenario: I view my organizations
    Given I have an organization
    When I view my organizations
    Then I should see an organization

  Scenario: I view an organization
    Given I have an organization
    When I view my first organization
    Then I should see my organization's name
