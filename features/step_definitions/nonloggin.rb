When /^(?:|I )click on the search field adding focus$/ do
  page.execute_script("jQuery('#q').focus()")
end
