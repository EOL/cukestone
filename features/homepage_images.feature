Feature: Explore Panel Images
  One should change about every 10 seconds
  Clicking on pause should stop the images changing
  Click the play button (after a pause) should start the images changing
  Clicking 'more species' should replace ALL of the images.
	
#Scenario: User is on the homepage and image rotation is on play
#  When I am on the homepage
#  When I see the pause image  #this means image rotation is currently on "play"
#  Then I should see the first explore image
#  Then I wait 20 seconds
#  Then I must see a different first explore image

Scenario: User is on the homepage and switches image rotation to pause
  When I am on the homepage
  When I see the pause image
  And I press the pause image
  Then I should see the play image #this means image rotation is paused
  Then I should see the first explore image
  Then I wait 11 seconds
  Then I must see the same first explore image