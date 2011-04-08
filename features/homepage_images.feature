Feature: Explore Panel Images
  One should change about every 10 seconds
  Clicking on pause should stop the images changing
  Click the play button (after a pause) should start the images changing
  Clicking 'more species' should replace ALL of the images.

Scenario: User is on the homepage and switches image rotation to pause
  When I am on the homepage
  When I see the pause image
  And I press the pause button
  Then I can see the play image
  Then I can see the first explore image
  Then I wait 20 seconds
  Then I must see the same first explore image

Scenario: User is on the homepage and image rotation is set to play
  When I am on the homepage
  When I see the pause image
  Then I can see the first explore image
  Then I wait 20 seconds
  Then I must see a different first explore image

Scenario: User pauses then plays image rotation
  When I am on the homepage
  When I see the pause image
  And I press the pause button
  Then I can see the play image
  Then I can see the first explore image
  And I press the play button
  Then I wait 20 seconds
  Then I must see a different first explore image

Scenario: User clicks "more species"
  When I am on the homepage
  When I see the pause image
  And I press the pause button
  Then I can see the first explore image
  And I can see the second explore image
  And I can see the third explore image
  And I can see the fourth explore image
  And I can see the fifth explore image
  And I can see the sixth explore image
  Then I click "more species"
  Then I wait 6 seconds
  Then I must see a different first explore image
  Then I must see a different second explore image
  Then I must see a different third explore image
  Then I must see a different fourth explore image
  Then I must see a different fifth explore image
  Then I must see a different sixth explore image

Scenario: User clicks a news item
  When I am on the homepage
  When I click all "news headlines" within "Whats New"
  Then I should see <expanded news item>
