Feature: Search

Scenario:  User tries to search but doesn't give any input
   When I go to the homepage
   When I fill in "q" with ""
   And I press ".search_image"
   Then I should see "Please enter a search term!"
