When /^(?:|I )see(?: the)? ([^\"]*) image(?:s)?$/ do | alt_or_id |
  res = to_selector(alt_or_id)
  page.should have_xpath("//img[@alt='#{res}' or @id='#{res}']")
end


Then /^(?:|I )should see(?: the)? ([^\"]*) image(?:s)?$/ do | alt_or_id |
  res = to_selector(alt_or_id)
  
  # Store image id's and titles as key-value pairs
  if @images == nil
    @images = Hash.new()
  end
  
  if page.should have_xpath("//img[@alt='#{res}' or @id='#{res}']")
    @images[alt_or_id] = find(:xpath, "//img[@alt='#{res}' or @id='#{res}']")[:title]

  end
end


Then  /^(?:|I )must see the same ([^\"]*) image(?:s)?$/ do | alt_or_id |
  res = to_selector(alt_or_id)
  if page.should have_xpath("//img[@alt='#{res}' or @id='#{res}']")
    this_img = find(:xpath, "//img[@alt='#{res}' or @id='#{res}']")[:title]
    @images[alt_or_id].should eql(this_img)
  end
end

Then  /^(?:|I )must see a different ([^\"]*) image(?:s)?$/ do | alt_or_id |
  res = to_selector(alt_or_id)
  if page.should have_xpath("//img[@alt='#{res}' or @id='#{res}']")
    this_img = find(:xpath, "//img[@alt='#{res}' or @id='#{res}']")[:title]
    @images[alt_or_id].should_not eql(this_img)
  end
end