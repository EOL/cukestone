When /^I (sign in|login) as a user$/ do |sign_or_log|
    visit (Cukestone::Conf.url + '/login')
    fill_in(to_selector('the username field'), :with => Cukestone::Conf.user)
    fill_in(to_selector('the password field'), :with => Cukestone::Conf.user_password)
    find(to_selector('the login button')).click
end

When /^I (sign in|login) as a curator$/ do |sign_or_log|
    visit (Cukestone::Conf.url + '/login')
    fill_in(to_selector('the username field'), :with => Cukestone::Conf.curator)
    fill_in(to_selector('the password field'), :with => Cukestone::Conf.curator_password)
    find(to_selector('the login button')).click
end

Given /^I am (signed in|logged in) as a user$/ do |sign_or_log|
  steps %Q{
    When I login as a user
    And wait 3 seconds
  }
end

Given /^I am (signed in|logged in) as a curator$/ do |sign_or_log|
  steps %Q{
    When I login as a curator
    And wait 3 seconds
  }
end
