require File.dirname(__FILE__) + "/base_modules.rb"

module DocumentHelpers
  include ConfigFinder

  def currently_focused
    page.evaluate_script('document.activeElement')[:id]
  end
end

World(DocumentHelpers)
