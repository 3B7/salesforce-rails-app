class Time
  def self.safe_parse_and_format value, format_time, default = nil
    puts "#safe_parse_and_format"
    Time.parse(value).strftime(format_time)
  rescue TypeError
    default
  end
end