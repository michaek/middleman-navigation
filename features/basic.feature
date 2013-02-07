Feature: Simple flat navigation
  Scenario: Navigation should render
    Given the Server is running at "basic-app"
    When I go to "/index.html"
    Then I should see "Home."
    Then the Home menu item should be selected
    When I go to "/subpage.html"
    Then I should see "Subpage."
