module TwScheduleIt
  class CLI
    attr_reader :schedule

    def initialize(schedule)
      @schedule = schedule
    end

    def start
      print_schedule
    end

    private

    def print_schedule
      schedule.to_a.each do |theme|
        puts "\n#{theme[:title]}:"
        theme[:morning].each { |talk| puts talk }
        puts ""
        theme[:afternoon].each { |talk| puts talk }
      end

      exit(0)
    end
  end
end
