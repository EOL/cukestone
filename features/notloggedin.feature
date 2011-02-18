Feature: Users Not Logged in

Scenario:  Does the homepage look reasonable?
   When I am on the homepage
   Then I should see "Imagine an electronic page for each species of organism on Earth..."
   And I should see "Explore"
   And I should see "EOL Announcements"
   And I should see "Featured"

@search
Scenario: Full-text Google Search should return a page of results
   When I am on the homepage
   And I choose fulltext search     
   And I fill in the search field with "lynx"
   And I press the search button
   Then I should see "googleSearchFrame"

@emptysearch
Scenario:  User tries to search but doesn't give any input
   When I go to the homepage
   And I fill in the search field with ""
   And I press the search button
   Then I should see "Please enter a search term!"
