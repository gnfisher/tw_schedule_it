require "tw_schedule_it/line_parser"

module TwScheduleIt
  class ImportFromFile
    def self.load_from_path(file_path)
      new(file_path).call
    end

    def initialize(file_path)
      @file_path = file_path
    end

    def call
      TwScheduleIt::TalksFactory.build(parse_file)
    end

    private

    def parse_file
      File.readlines(@file_path).reduce([]) do |parsed, line|
        unless line.strip.empty?
          parsed << LineParser.new(line).call
        end

        parsed
      end
    end
  end
end
