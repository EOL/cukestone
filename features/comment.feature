Feature: Tagging and Comment 

  
  Scenario: Adding tags should update both the public tags and the "my tags" areas.
  Given I sign in as a user
  When I am on the tiger page  
  And I follow the tag image link  
  And I fill in the Add Tag field with "tiger"
  And press Add This Tag button
  And wait 3 seconds
  Then I should see "tiger" within the public image tags block
  And should see "tiger" within my tags block
  
  
  Scenario: Submit button should do nothing if comment is empty
  Given I sign in as a user
  When I am on the tiger page
  And follow the image comment link
  And press the Post Comment button
  And wait 3 seconds
  Then I should see "Comment should not be empty"
  
  
  Scenario: Comments should be posted successfully if it is not empty 
  Given I sign in as a user
  When I am on the tiger page
  And follow the image comment link
  And fill in the add new comment field with "This is a new comment test."
  And press the Post Comment button
  And wait 3 seconds
  Then I should see "This is a new comment test."


  Scenario: The comment-count on the comment icon should get updated for each addition of comment on image .
  Given I sign in as a user
  When I am on the tiger page
  And wait 3 seconds
  And I should see the image comment count
  And follow the image comment link
  And fill in the add new comment field with "test 2."
  And press the Post Comment button
  And wait 3 seconds
  Then I should see "test 2."
  And I should see the image comment count increased by 1
  
  
  Scenario: Paginating should be available if there are more than 10 comments of Images   
  Given I sign in as a user
  When I am on the tiger page
  And I should see the image comment count  
  And follow the image comment link
  And wait 3 seconds  
  Then I should see the pagination

  
  Scenario: comment count should remain the same after paginating
  Given I sign in as a user
  When I am on the tiger page
  And I should see the image comment count  
  And follow the image comment link
  And wait 3 seconds  
  And I should see the pagination
  And I follow "Next »"
  Then I should see the image comment count increased by 0

 
  Scenario: The comment-count on the comment icon should get updated for each addition of comment on text .
  Given I sign in as a user
  When I am on the tiger page
  And wait 3 seconds
  And I should see the text comment count
  And follow the text comment link
  And fill in the add new comment field with "text page comment."
  And press the Post Comment button
  And wait 3 seconds
  Then I should see "text page comment."
  And I should see the text comment count increased by 1

  
  Scenario: Paginating should be available if there are more than 10 comments of text 
  Given I sign in as a user
  When I am on the tiger page
  And I should see the text comment count  
  And follow the image comment link
  And wait 3 seconds  
  Then I should see the pagination

  
  Scenario: text comment count should remain the same after paginating
  Given I sign in as a user
  When I am on the tiger page
  And I should see the text comment count  
  And follow the text comment link
  And wait 3 seconds  
  And I should see the pagination
  And I follow "Next »"
  Then I should see the text comment count increased by 0