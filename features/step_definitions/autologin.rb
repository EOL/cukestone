When /^(.+) should be visible$/ do |field|
  find(to_selector(field)).visible?.should be_true
end

Then /^(.+) should be invisible$/ do |field|
  find(to_selector(field)).visible?.should be_false
end
