Feature: Search

Scenario:  User tries to search but doesn't give any input
   When I go to the homepage
   When I fill in "q" with ""
   And I press "the search button"
	Then I should see "Please enter a search term!"
