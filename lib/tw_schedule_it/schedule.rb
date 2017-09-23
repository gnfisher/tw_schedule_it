require 'forwardable'
require "time"

module TwScheduleIt
  class Schedule
    attr_reader :themes, :talks

    def initialize(talks)
      @talks = talks
      @themes = []
    end

    def build
      schedule_talks
      self
    end

    def to_a
      themes.each_with_index.map do |theme, i|
        t             = {}
        t[:title]     = "Theme #{i + 1}"
        t[:morning]   = theme.morning.to_a << "12:00PM Lunch"
        t[:afternoon] = theme.afternoon.to_a << "05:00PM Networking Event"
        t
      end
    end

    private

    attr_writer :themes

    # Use Decreasing First Fit Bin Packing Algo
    #
    # Some sources used:
    # https://en.wikipedia.org/wiki/Bin_packing_problem#First-fit_algorithm
    # https://gist.github.com/pachacamac/a2f5fec2ebb77fd2540b
    #
    # For future possible optimization, see ideas in this SO answer:
    # https://stackoverflow.com/a/16641501
    def schedule_talks
      themes.clear << Theme.new

      sorted_talks.each_with_index do |talk, i|
        scheduled = false

        themes.each do |theme|
          break if scheduled
          scheduled = true if theme.schedule_talk(talk)
        end

        unless scheduled # create new theme and schedule it
          themes << Theme.new.tap { |t| t.schedule_talk(talk) }
        end
      end
    end

    def sorted_talks
      talks.sort { |a, b| a.duration <=> b.duration }.reverse
    end

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
end
