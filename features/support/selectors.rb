module SelectorHelpers
  # Maps a name to a selector object.
  
  def to_selector(from)
    case from
      
      when /the search button/
         '.search_image'
         
     else
      from
      #raise "Can't find mapping from \"#{from}\" to a selector.\n" +
      #      "Now, go and add a mapping in #{__FILE__}"
    end
  end   
end

World(SelectorHelpers)

