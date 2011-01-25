module SelectorHelpers
  # Maps a name to a selector object.
  
  def to_selector(from)
    case from
      
      when /the search button/
         '.search_image'
      
      when /the search field/
         'q'
         
      when /the username field/
      	  'user_username'
      
      when /the password field/
      	  'user_password' 
      	  
      when /the error flash area/
      	      'flash-bad'
      	      
     else
       
      # if we can't find a mapping, just return the name that was to be mapped
      from
    
    end
  end   
end

World(SelectorHelpers)

