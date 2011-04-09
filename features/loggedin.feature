Feature: User logged in

  @ongo
  Scenario: Try logging in with an incorrect password
  When I am on the login page
  And I fill in the username field with "abc"
  And I fill in the password field with "abc"
  And press the login button
  Then I should see "Invalid login or password"

  @flash
  Scenario: Flash Error Message should close in 2 seconds automatically
  When I am on the login page
  And I fill in the username field with "klans"
  And fill in the password field with "abc"
  And press the login button
  And the Flash Error Message should be visible
  And I wait 3 seconds
  Then the Flash Error Message should be invisible

  @addnewcontent
  Scenario: The "Add New Content" text link, the "add text" icons and the X close button should work
  Given I am signed in as a user
  When I am on the tiger page
  And I follow the Add New Content link
  Then I should see the Add New Content popup
  When I press the Add New Content close button
  And I press the Add New Content content button
  Then I should see the Add New Content popup
  When I press the Add New Content close button
  And I press the Add New Content toc button
  Then I should see the Add New Content popup

  #@contentnogo
  #Scenario: Adding from a content item that doesn't allow content (ie: common names) should work
  #Given I am signed in as a user
  #When I am on the tiger page
  #And I follow "Common Names"

  @emptytextcontent
  Scenario: Submitting text with empty content should show an error (for 2 seconds) and not submit.
  Given I am signed in as a user
  When I am on the tiger page
  And I follow the Add New Content link
  And I press the Add New Content preview button
  Then I should see "A Description must be entered."
  And I wait 2 seconds
  When I press the Add New Content confirm button
  Then I should see "A Description must be entered."

  @preview
  Scenario: Preview should work
  Given I am signed in as a user
  When I am on the tiger page
  And I follow the Add New Content link
  And I fill in the Add New Content Title field with "TigerTitlePreview"
  And I fill in the Add New Content Text field with "TigerTextPreview"
  And I fill in the Add New Content References field with "TigerRefsPreview"
  And I press the Add New Content preview button
  Then I should see "TigerTitlePreview"
  And I should see "Source and Additional Information"

  @confirm
  Scenario: Submit should work
  Given I am signed in as a user
  When I am on the tiger page
  And I follow the Add New Content link
  And I fill in the Add New Content Title field with "TigerTitleSubmit"
  And I fill in the Add New Content Text field with "TigerTextSubmit"
  And I fill in the Add New Content References field with "TigerRefsSubmit"
  And I press the Add New Content confirm button
  Then I should see "TigerTitleSubmit"
  And I should see "Source and Additional Information"

  @subafterprev
  Scenario: Submitting after using the preview should remove the preview before submitting.
  Given I am signed in as a user
  When I am on the tiger page
  And I follow the Add New Content link
  And I fill in the Add New Content Title field with "TigerTitlePreview"
  And I fill in the Add New Content Text field with "TigerTextPreview"
  And I fill in the Add New Content References field with "TigerRefsPreview"
  And I press the Add New Content preview button
  Then I should see "TigerTitlePreview"
  And I should see "Source and Additional Information"
  When I fill in the Add New Content Title field with "TigerTitleSubmit"
  And I fill in the Add New Content Text field with "TigerTextSubmit"
  And I fill in the Add New Content References field with "TigerRefsSubmit"
  And I press the Add New Content confirm button
  Then I should not see "TigerTitlePreview"
  And I should see "TigerTitleSubmit"
  And I should see "Source and Additional Information"








