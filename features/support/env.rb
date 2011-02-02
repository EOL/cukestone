require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

require 'cucumber/formatter/unicode' # Remove this line if you don't want Cucumber Unicode support
require 'capybara/cucumber'
require 'capybara/session'

# Capybara defaults to XPath selectors rather than Webrat's default of CSS3. In
# order to ease the transition to Capybara we set the default here. If you'd
# prefer to use XPath just remove this line and adjust any selectors in your
# steps to use the XPath syntax.
Capybara.default_selector = :css
Capybara.save_and_open_page_path = 'tmp'

Capybara.register_driver :selenium_customized do |app|
  Capybara::Driver::Selenium.new(app, :browser => Cukestone::Conf.browser.to_sym)
end

Capybara.app_host = Cukestone::Conf.url

After do |scenario|
  if(scenario.failed?)
    puts
    puts "*"*80
    puts scenario.exception.message
    puts scenario.backtrace_line
    puts "*"*80
  end
end

Before do
  Capybara.current_driver = :selenium_customized
end
