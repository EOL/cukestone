Feature: Tagging and Comment

### Tag #####

  Scenario: Adding tags should update both the public tags and the "my tags" areas.
  Given I am signed in as a user
  When I am on the tiger page
  And I follow the tag image link
  And I fill in the Add Tag field with "tiger"
  And press Add This Tag button
  And wait 3 seconds
  Then I should see "tiger" within the public image tags block
  And should see "tiger" within my tags block


### Comments ###
  Scenario: Submit button should do nothing if comment is empty
  Given I am signed in as a user
  When I am on the tiger page
  And follow the image comment link
  And press the Post Comment button
  And wait 3 seconds
  Then I should see "Comment should not be empty"


  Scenario: Comments should be posted successfully if it is not empty
  Given I am signed in as a user
  When I am on the tiger page
  And follow the image comment link
  And fill in the add new comment field with "This is a new comment test."
  And press the Post Comment button
  And wait 3 seconds
  Then I should see "This is a new comment test."


  Scenario: The comment-count on the comment icon should get updated for each addition of comment on image .
  Given I am signed in as a user
  When I am on the tiger page
  And wait 3 seconds
  And I can see the image comment count
  And follow the image comment link
  And fill in the add new comment field with "test 2."
  And press the Post Comment button
  And wait 3 seconds
  Then I should see "test 2."
  And I can see the image comment count increased by 1

  Scenario: Paginating should be available if there are more than 10 comments of Images
  Given I am signed in as a user
  When I am on the tiger page
  And I can see the image comment count
  And follow the image comment link
  And wait 3 seconds
  Then I should see the pagination

  Scenario: Comment count should remain the same after paginating
  Given I am signed in as a user
  When I am on the tiger page
  And I can see the image comment count
  And follow the image comment link
  And wait 3 seconds
  And I should see the pagination
  #And I follow "Next »"
  And I follow "2"
  Then I can see the image comment count increased by 0


  Scenario: The comment-count on the comment icon should get updated for each addition of comment on text
  Given I am signed in as a user
  When I am on the tiger page
  And wait 3 seconds
  And I can see the text comment count
  And follow the text comment link
  And fill in the add new comment field with "text page comment."
  And press the Post Comment button
  And wait 3 seconds
  Then I should see "text page comment."
  And I can see the text comment count increased by 1


  Scenario: Paginating should be available if there are more than 10 comments of text
  Given I am signed in as a user
  When I am on the tiger page
  And I can see the text comment count
  And follow the image comment link
  And wait 3 seconds
  Then I should see the pagination

  Scenario: text comment count should remain the same after paginating
  Given I am signed in as a user
  When I am on the tiger page
  And I can see the text comment count
  And follow the text comment link
  And wait 3 seconds
  And I should see the pagination
  #And I follow "Next »"
  And I follow "2"
  Then I can see the text comment count increased by 0
