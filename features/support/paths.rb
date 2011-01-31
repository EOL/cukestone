module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    #match given the page name with the first that matches a key from
    #config/config.yml collections then return the associated
    #path value from the configuration
    if not Cukestone::Conf.paths.keys.detect {| path | Regexp.new(path).match(page_name)}.nil? then
      Cukestone::Conf.paths[$&] 
    else 
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in config/config.yml"
      end
    end
  end
end

World(NavigationHelpers)
