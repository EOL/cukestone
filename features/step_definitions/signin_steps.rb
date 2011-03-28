
When /^(.+) should be visible$/ do |field|
  find(to_selector(field)).visible?.should be_true
end

Then /^(.+) should be invisible$/ do |field|
  find(to_selector(field)).visible?.should be_false
end

When /^I login as a user$/ do
    fill_in(to_selector('the username field'), :with => Cukestone::Conf.user)
    fill_in(to_selector('the password field'), :with => Cukestone::Conf.user_password)
    find(to_selector('the login button')).click
end

When /^I login as a curator$/ do
    fill_in(to_selector('the username field'), :with => Cukestone::Conf.curator)
    fill_in(to_selector('the password field'), :with => Cukestone::Conf.curator_password)
    find(to_selector('the login button')).click
end

Given /^I sign in as a (.*)$/ do |user|
  steps %Q{
    When I am on the login page
    And I login as a #{user}
    And wait 3 seconds
  }  
end

Given /^I fill in (.+) with the "([^"]*)"$/ do |field,password|	
  fill_in(to_selector(field), :with => to_selector(password))
end









