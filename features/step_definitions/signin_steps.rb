
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
    And I fill in the password field with \"c@pstone!\"
    And I press the login button
    And wait 3 seconds
  }  
end


When /^(?:|I )follow ([^"]*)(?: within ([^"]*))?$/ do |link, selector|
  click_link(to_selector(link))
  #res = find(to_selector(link))
  #res ? res.click_link : click_link(link)
end

When /^(?:|I )follow the link with text "([^"]*)"$/ do |link|
  find_link(link).click
end

When /^(?:|I )follow the link with text "([^"]*)" within (.+)$/ do |link,selector|
  with_scope(to_selector(selector)) do
    find_link(link).click
  end
end


Then /^(?:|I )should see "([^"]*)" within (.+)$/ do |text, selector|	
  with_scope(to_selector(selector)) do
    if page.respond_to? :should
      page.should have_content(text)
    else
      assert page.has_content?(text)
    end
  end
end

When /^(?:|I )should see a link with text "([^"]*)"$/ do |text|
  #page.has_selector?('a',:text=>'${text}')
  #page.has_link?(text)
  page.should have_link(text)
end

When /^(?:|I )should see a link with text "([^"]*)" within (.+)$/ do |text,selector|
  with_scope(to_selector(selector)) do
    page.should have_link(text)		
  end	  
end

Then /^(?:|I )should not see a link with text "([^"]*)"$/ do |text|
  #page.has_no_link?(text)
  page.should_not have_link(text)
end

Then /^(?:|I )should not see a link with text "([^"]*)" within (.+)$/ do |text,selector|
  with_scope(to_selector(selector)) do
    page.should_not have_link(text)		
  end
  #page.has_no_link?(text)
  #page.should_not have_link(text)
end




