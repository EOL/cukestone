require File.dirname(__FILE__) + "/base_modules.rb"

module NavigationHelpers
  include ConfigFinder
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    suffix = self.get_item(page_name, :paths) do
      #if no matches
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in config/paths.yml"
      end
    end
  end
end

World(NavigationHelpers)
