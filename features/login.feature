# features/welcome.feature
Feature: Home page

  Scenario: redirect to adminstration page
    Given I input the username and password
    When I click login button
    Then I should go to adminstration page
