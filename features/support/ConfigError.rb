class ConfigError < StandardError
  def initialize(section, msg)
    @section, @message = section.to_sym, msg
  end

  def message
    "Configuration Error in \'#{@section}.yml\': #{@message}"
  end
end

class TestFailure < StandardError
  def initialize(reason, *offenders)
    @reason, @offenders = reason, offenders
  end

  def message
    msg = "Failed Test: "
    @offenders.each do |o|
      msg += o
      msg += ", " if o != @offenders.last
    end
    msg += " #{@reason}."
  end
end

if __FILE__ == $0 then
  begin
    raise ConfigError.new(:self_test, "self test succesfull!")
  rescue ConfigError => e
    puts e.message
  end
end
