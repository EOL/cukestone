require File.dirname(__FILE__) + "/base_modules.rb"

module SelectorHelpers
  include ConfigFinder
  # Maps a name to a selector object.
  def to_selector(from)
    self.get_item(from, :selectors) do #if not matches
      # If a selector can't be found the argument is returned
      from 
    end
  end   
end

World(SelectorHelpers)
