require File.dirname(__FILE__) + "/base_modules.rb"

module SelectorHelpers
  include ConfigFinder
  # Maps a name to a selector object.
  def to_selector(from)
    self.get_item(from, :selectors) do #if not matches
      raise "Can't find selector for key: #{from}, \n" +
        "Please add it to config/selectors.yml"
    end
  end   
end

World(SelectorHelpers)

