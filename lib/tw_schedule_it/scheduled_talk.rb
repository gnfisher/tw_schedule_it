require "forwardable"

module TwScheduleIt
  class ScheduledTalk
    extend Forwardable
    def_delegators :@talk, :duration, :title

    attr_reader :session, :start_time

    def initialize(args={})
      @talk       = args[:talk]
      @session    = args[:session]
      @start_time = args[:start_time]
    end

    def to_s
      "#{human_start_time} #{title}"
    end

    private

    def human_start_time
      start_time.strftime('%I:%M%p')
    end
  end
end
