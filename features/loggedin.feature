Feature: User logged in
  #And I wait 5 seconds #don't need this one anymore
  
 
  Scenario: Try logging in with an incorrect password
  When I am on the login page
  And I fill in the username field with "abc"
  And I fill in the password field with "abc"
  And press the login button
  Then I should see "Invalid login or password" 


  Scenario: Flash Error Message should close in 2 seconds automatically
  When I am on the login page
  And I fill in the username field with "klans"
  And fill in the password field with "abc"
  And press the login button
  And the Flash Error Message should be visible
  And I wait 3 seconds
  Then the Flash Error Message should be invisible
  

 