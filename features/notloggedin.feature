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
  And I should have the following pairs in the query string:
    |q|lynx|
    |search_type|google|

#Note : This query does not currently have more than 2 pages of results
@tagradiobtn
Scenario: Does the "tag" radio button stay selected after a search for "video"? More than 2 pages of results?
  When I am on the homepage
  And I choose tag search
  And I fill in the search field with "video"
  And I press the search button
  Then the tag search checkbox should be checked
  And I wait 7 seconds
  And I should have the following pairs in the query string:
    |q|video|
    |search_type|tag|
  #And I should see more than two pages of result...

@focus
Scenario: Giving focus to the search box should select all of the text there.
  When I am on the homepage
  And I fill in the search field with "selected"
  And I click on the page
  And I click on the search field adding focus
  Then the selected text is "selected"

@emptysearch
Scenario:  User tries to search but doesn't give any input
  When I go to the homepage
  And I fill in the search field with ""
  And I press the search button
  Then I should see "Please enter a search term!"
