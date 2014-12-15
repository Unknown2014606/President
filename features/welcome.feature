# features/welcome.feature
Feature: Home page

  Scenario: redirect to view page
    Given I am on the welcome page
    When I click view button
    Then I should go to video page
