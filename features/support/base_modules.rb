module ConfigFinder
  def get_item(what, from_where, &if_no_matches)
    conf_table = Cukestone::Conf.instance_variable_get(:@table)
    keys = conf_table[from_where].keys
    
    #try an exact match first
    selector_name = keys.detect { |selector| selector.eql? what }
    if selector_name.nil? then
      #do a regular expression match instead
      selector_name = keys.detect do |selector| 
        what =~ Regexp.new(selector)
      end
    end
    #There will never be more than one match because everything in
    #Conf is stored in a hash, therefore, detecting multiple keys
    #will need to happen possibly even before the YAML module loads
    #the info into the Conf hash in the Cukestone module
    
    if not selector_name.nil? then
      conf_table[from_where][selector_name]
    else
      if_no_matches.call
    end
  end
end