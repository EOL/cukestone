require 'yaml'
require 'ostruct'

module Cukestone
  conf = open(File.join(File.dirname(__FILE__), 'config.yml')).read
  conf_dict = YAML.load(conf) 
  Conf = OpenStruct.new(conf_dict)
end

