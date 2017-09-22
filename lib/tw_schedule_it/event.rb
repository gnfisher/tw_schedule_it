module TwScheduleIt
  class Event
    attr_reader :talks, :schedule

    def initialize(args={}, schedule_class = Schedule)
      @talks = args[:talks]
      @schedule = schedule_class(@talks)
    end
  end
end
