Feature: User logged in

  @ongo
  Scenario: Try logging in with an incorrect password
  When I am on the login page
  And I fill in the username field with "abc"
  And I fill in the password field with "abc"
  And press the login button
  Then I should see "Invalid login or password"

  @flash
  Scenario: Flash Error Message should close in 2 seconds automatically
  When I am on the login page
  And I fill in the username field with "klans"
  And fill in the password field with "abc"
  And press the login button
  And the Flash Error Message should be visible
  And I wait 3 seconds
  Then the Flash Error Message should be invisible
