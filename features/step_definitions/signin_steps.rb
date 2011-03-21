
When /^(.+) should be visible$/ do |field|
  find(to_selector(field)).visible?.should be_true
end

Then /^(.+) should be invisible$/ do |field|
  find(to_selector(field)).visible?.should be_false
end

Given /^I sign in as "(.*)"$/ do |user|
  steps %Q{
    When I am on the login page
    And I fill in the username field with "#{user}"
    And I fill in the password field with the "#{user}_password"
    And I press the login button
    And wait 3 seconds
  }  
end

Given /^I fill in (.+) with the "([^"]*)"$/ do |field,password|	
  fill_in(to_selector(field), :with => to_selector(password))
end









