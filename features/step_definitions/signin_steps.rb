Then /^(?:|I )can see (the text comment count|the image comment count)(?: increased by (\d+))?$/ do |selector,number|
  if @comment_count
  	  new_count = find(to_selector(selector)).text.to_i
  	  (new_count - @comment_count).should == number.to_i
  else
  	  @comment_count = find(to_selector(selector)).text.to_i
  end
end
