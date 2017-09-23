module TwScheduleIt
  class CLI
    attr_reader :event

    def initialize(event)
      @event = event
    end

    def start
      print_schedule
    end

    private

    def print_schedule
      event.schedule.to_a.each do |theme|
        puts "\n#{theme[:title]}:"
        theme[:morning].each { |talk| puts talk }
        puts ""
        theme[:afternoon].each { |talk| puts talk }
      end

      exit(0)
    end
  end
end
