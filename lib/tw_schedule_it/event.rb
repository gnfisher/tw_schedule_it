module TwScheduleIt
  class Event
    attr_reader :talks

    def initialize(args={}, schedule_class = Schedule)
      @talks = args[:talks]
    end

    def schedule
      @schedule ||= schedule_class.new(talks)
    end
  end
end
