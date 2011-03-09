Feature: Users Not Logged in

Scenario:  Does the homepage look reasonable?
  When I am on the homepage
  Then I should see "Imagine an electronic page for each species of organism on Earth..."
  And I should see "Explore"
  And I should see "EOL Announcements"
  And I should see "Featured"

@google
Scenario: Full-text Google Search should return a page of results
  When I am on the homepage
  And I choose fulltext search
  And I fill in the search field with "lynx"
  And I press the search button
  Then I should see "googleSearchFrame"

#Note : This query does not currently have more than 2 pages of results
@tag
Scenario: Does the "tag" radio button stay selected after a search for "video"? More than 2 pages of results?
  When I am on the homepage
  And I choose tag search
  And I fill in the search field with "video"
  And I press the search button
  Then the tag search checkbox should be checked
  #And I should see more than two pages of result...

@emptysearch
Scenario:  User tries to search but doesn't give any input
  When I go to the homepage
  And I fill in the search field with ""
  And I press the search button
  Then I should see "Please enter a search term!"

@create_account
Scenario: Create an account
  When I am on the homepage
  And I follow "create an account"
  Then I should be on the registration page
  Then the username field should have focus
  When I fill in the username field with "capstone_user"
  And I fill in the register password field with "abcde"
  Then I should see "capstone_user is already taken"
  When I fill in the username field with "something_unique"
  When I fill in the email address field with "klans@eol.org"
  And I fill in the confirm password field with "abcde"
  Then I should not see "capstone_user is already taken"
  And I should see "klans@eol.org is already taken"
  When I fill in the email address field with "something@unique.com"
  Then I should not see "something@unique.com is already taken"
  Then I fill in the given name field with "given"
  Then I fill in the family name field field with "name"
  #When I check the curator checkbox
  #Then I should see "Select a clade"
  #When I click "show clade browser"
  #Then I should see the clade list
  #When I click on the + sign
  #Then I should see its children
  #When I click on a child's + sign
  #Then I should see more children
  #When I click on a low level child
  #Then that child should be bold
  #When I click "clear"
  #Then that child should not be bold
  #When I click "hide clade browser"
  #Then I should not see the clade list
  #When I uncheck the curator checkbox
  #Then I should not see "Select a clade"
  #And I should see the reCaptcha
