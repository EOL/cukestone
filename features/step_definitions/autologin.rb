When /^I login as a user$/ do
    visit (Cukestone::Conf.url + '/login')
    fill_in(to_selector('the username field'), :with => Cukestone::Conf.user)
    fill_in(to_selector('the password field'), :with => Cukestone::Conf.user_password)
    find(to_selector('the login button')).click
end

When /^I login as a curator$/ do
    visit (Cukestone::Conf.url + '/login')
    fill_in(to_selector('the username field'), :with => Cukestone::Conf.curator)
    fill_in(to_selector('the password field'), :with => Cukestone::Conf.curator_password)
    find(to_selector('the login button')).click
end
