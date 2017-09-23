module TwScheduleIt
  module ImportFromFile
    def self.build(file_path)
      file_lines = File.new(file_path) { |f| f.readlines }
      file_lines.map { |line| parse(line) }.compact
    end

    private

    def self.parse(string)
      return if string.strip.empty?

      if /\d/ =~ string # Is there any digit in string?
        title    = string.strip
        duration = string[/\d+/].strip.to_i
      else # No digits in string so must be lightning talk
        title    = string.strip
        duration = 5
      end

      [title, duration]
    end
  end
end
