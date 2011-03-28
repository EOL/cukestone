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


When /^(?:|I )follow ([^"]*)(?: within ([^"]*))?$/ do |link, selector|
  click_link(to_selector(link))
end

When /^(?:|I )follow the link with text "([^"]*)"(?: within (.+))$/ do |link,selector|
  with_scope(to_selector(selector)) do
    find_link(link).click
  end
end

Then /^(?:|I )should see the comment count(?: increased by (\d+))?$/ do |number|	
  if @comment_count 	  
    new_count = find(to_selector('the comment count')).text.to_i
    (new_count - @comment_count).should == number.to_i
  else  	  
    @comment_count = find(to_selector('the comment count')).text.to_i
  end
end


Then /^(?:|I )should see "([^"]*)" within (.+)$/ do |text, selector|
  with_scope(to_selector(selector)) do	  
      page.should have_content(text)
  end
end

When /^(?:|I )should see a link with text "([^"]*)"(?: within (.+))?$/ do |text,selector|
  with_scope(to_selector(selector)) do
    page.should have_link(text)		
  end	  
end


Then /^(?:|I )should not see a link with text "([^"]*)"(?: within (.+))?$/ do |text,selector|
  with_scope(to_selector(selector)) do
    page.should_not have_link(text)		
  end
end









