require File.dirname(__FILE__) + '/ConfigError'

module ConfigFinder
  def get_item(what, from_where, &if_no_matches)
    from_where = from_where.to_sym
    conf_table = Cukestone::Conf.instance_variable_get(:@table)
    keys = conf_table[from_where].keys
    
    #try an exact match first
    selector_name = keys.select { |selector| selector.eql? what }
    if selector_name.length < 1 then
      #do a regular expression match instead
      selector_name = keys.select do |selector| 
        what =~ Regexp.new(selector)
      end
    end
    if selector_name.length > 1 then
      raise ConfigError.new(from_where, "Multiple matches for #{what} : " +
        "#{selector_name.inspect}\nPlease correct this in #{from_where}.yml")
    else
      selector_name = selector_name.first
      if not selector_name.nil? then
        conf_table[from_where][selector_name]
      else
        if_no_matches.call
      end
    end
  end
end