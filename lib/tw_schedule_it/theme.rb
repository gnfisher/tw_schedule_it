module TwScheduleIt
  class Theme
    attr_reader :morning, :afternoon

    def initialize
      @morning = Session.new(max_time: 180, start_time: morning_start_time)
      @afternoon = Session.new(max_time: 240, start_time: afternoon_start_time)
    end

    def schedule_talk(talk)
      if talk.duration <= morning.time_remaining
        morning.schedule_talk(talk)
        return true
      elsif talk.duration <= afternoon.time_remaining
        afternoon.schedule_talk(talk)
        return true
      end

      false
    end

    def scheduled_talks
      morning.scheduled_talks + afternoon.scheduled_talks
    end

    private

    def morning_time_remaining
      morning.time_remaining
    end

    def afternoon_time_remaining
      afternoon.time_remaining
    end

    # Returns tomorrow's date, 9AM in current time zone
    def morning_start_time
      now = DateTime.now
      DateTime.new(now.year, now.month, now.day + 1, 9, 0, 0, now.zone)
    end

    # Returns tomorrow's date, 1PM in current time zone
    def afternoon_start_time
      now = DateTime.now
      DateTime.new(now.year, now.month, now.day + 1, 13, 0, 0, now.zone)
    end
  end
end
