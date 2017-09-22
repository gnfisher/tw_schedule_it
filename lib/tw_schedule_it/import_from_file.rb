module TwScheduleIt
  module ImportFromFile
    def self.build(file_path)
      file_lines = File.new(file_path).readlines
      file_lines.map { |line| parse(line) }
    end

    private

    def self.parse(string)
      if /\d/ =~ string # Is there any digit in string?
        title    = string.split(/\d/)[0].strip
        duration = string[/\d+/].strip.to_i
      else # No digits in string so must be lightning talk
        title    = string.gsub('lightning', '').strip
        duration = 5
      end

      [title, duration]
    end
  end
end
