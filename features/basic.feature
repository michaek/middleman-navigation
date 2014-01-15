Feature: Simple flat navigation
  Scenario: Navigation should render
    Given the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "Home."
    Then the Home menu item should be selected
    When I go to "/subpage.html"
    Then I should see "Subpage."
    Then the Subpage menu item should be selected
    Then the Another menu item should not be selected
    When I go to "/another.html"
    Then I should see "Subpage."
    Then the Another menu item should be selected
    Then the Subpage menu item should not be selected

  Scenario: Child menu should render
    Given the Server is running at "basic-app"
    When I go to "/another/child.html"
    Then I should see "Child."
    Then the Child menu item should be selected
