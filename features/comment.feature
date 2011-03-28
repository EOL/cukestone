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

  
  Scenario: The comment-count on the comment icon should get updated for each addition of comment on image and text.
  Given I sign in as a user
  When I am on the tiger page
  And wait 3 seconds
  And I should see the comment count
  And follow the image comment link
  And fill in the add new comment field with "test 2."
  And press the Post Comment button
  And wait 3 seconds
  Then I should see "test 2."
  And I should see the comment count increased by 1
  
  @js
  Scenario: Paginating should be available if there are more than 10 comments of Images   
  Given I sign in as a user
  When I am on the tiger page
  And I should see the comment count  
  And follow the image comment link
  And wait 3 seconds  
  And I should see the pagination
  And I should not see a link with text "1" within the comments block
  And I should see a link with text "2" within the comments block
  And I follow the link with text "Next"
  Then I should see a link with text "1" within the comments block
  And should not see a link with text "2" within the comments block
  And should see the comment count increased by 0  
  
