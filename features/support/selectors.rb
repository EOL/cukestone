module SelectorHelpers
  # Maps a name to a selector object.
  
  def to_selector(from)
    #match given the css selector with the first that matches a key from
    #config/config.yml selector collections and return it's value
    
    #first try an exact match, then try a regular expression match
    keys = Cukestone::Conf.selectors.keys
    selector_name = keys.select { | selector |
      selector.eql? from
    } || keys.select { |selector|
      /#{selector}/.match(from)
    }
    
    first_match  = selector_name.first
    if not first_match.nil? then
      Cukestone::Conf.selectors[first_match]
    else       
      # if we can't find a mapping, just return the name that was to be mapped
      from
    end
  end   
end

World(SelectorHelpers)

