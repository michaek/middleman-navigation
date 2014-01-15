Feature: No navigation
  Scenario: Navigation should not error if none is defined
    Given the Server is running at "empty-app"
    When I go to "/index.html"
    Then I should see "Home."
