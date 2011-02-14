require 'yaml'
require 'ostruct'

module Cukestone  
  conf = open(File.join(File.dirname(__FILE__), 'config.yml')).read
  conf_dict = YAML.load(conf) 
  Conf = OpenStruct.new(conf_dict)
  
  Conf.paths = YAML.load(open(File.join(File.dirname(__FILE__), 'paths.yml')).read)
  Conf.selectors = YAML.load(open(File.join(File.dirname(__FILE__), 'selectors.yml')).read)
end

#self-test methods can go here
#this is not executed if this is not
#the top level script
if __FILE__ == $0 then
#  puts "Here are the paths available to Cukestone"
#  p Cukestone::Conf.paths
  
  i_want = "the homepage"
  #try exact match
  key = Cukestone::Conf.paths.keys.select { |i| i.eql? i_want }
  if key.length <= 0 then
    #try regular expression matches instead
    key = Cukestone::Conf.paths.keys.select do |i|
      i_want =~ Regexp.new(i)
    end
  end
  key = key.first
  puts "The key is: #{key}"
  puts "The value is: #{Cukestone::Conf.paths[key]}"
  
#  puts "Here are the selectors available to Cukestone"
#  p Cukestone::Conf.selectors
end

