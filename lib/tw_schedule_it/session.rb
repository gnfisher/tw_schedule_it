module TwScheduleIt
  class Session
    attr_accessor :time_remaining
    attr_reader :scheduled_talks, :start_time, :max_time

    def initialize(args={})
      @start_time      = args[:start_time]
      @time_remaining  = args[:max_time]
      @max_time        = args[:max_time]
      @scheduled_talks = []
    end

    def schedule_talk(talk)
      @scheduled_talks << ScheduledTalk.new(talk: talk, session: self, start_time: next_talk_start_time)
      self.time_remaining = time_remaining - talk.duration
    end

    def to_a
      scheduled_talks.map { |talk| talk.to_s }
    end

    private

    def next_talk_start_time
      minutes = @scheduled_talks.reduce(0) { |min, talk| min + talk.duration }
      start_time + Rational(minutes, 1_440)
    end
  end
end
