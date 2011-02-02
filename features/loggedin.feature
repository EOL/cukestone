Feature: User logged in

  @ongo 
  Scenario: Try logging in with an incorrect password
  When I am on the login page
  And I fill in "Username" with "abc"
  And fill in "Password" with "abc"
  And press the login button
  And I wait 5 seconds
  Then I should see "Invalid login or password" 


