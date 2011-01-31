require 'yaml'
require 'ostruct'

module Cukestone
  conf = open(File.join(File.dirname(__FILE__), 'config.yml')).read
  conf_dict = YAML.load(conf) 
  Conf = OpenStruct.new(conf_dict)
end

#self-test methods can go here
#this is not executed if this is not
#the top level script
if __FILE__ == $0 then
  puts "Here are the paths available to Cukestone"
  p Cukestone::Conf.paths
  
  puts
  
  puts "Here are the selectors available to Cukestone"
  p Cukestone::Conf.selectors
end

