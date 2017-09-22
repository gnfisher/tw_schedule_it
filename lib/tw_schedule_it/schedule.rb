module TwScheduleIt
  class Schedule
    attr_accessor :themes, :talks # fix permissions later

    def initialize(talks)
      @talks = talks
      @themes = []
      schedule_talks(sorted_talks)
    end

    # Use Decreasing First Fit Bin Packing Algo
    #
    # Some sources used:
    # https://en.wikipedia.org/wiki/Bin_packing_problem#First-fit_algorithm
    # https://gist.github.com/pachacamac/a2f5fec2ebb77fd2540b
    #
    # For future possible optimization, see ideas in this SO answer:
    # https://stackoverflow.com/a/16641501
    def schedule_talks(talks)
      themes.clear << Theme.new

      talks.each_with_index do |talk, i|
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

    def shuffle_talks
      schedule_talks(sorted_talks)
    end

    def to_a
      themes.each_with_index.map do |theme, i|
        t = {}
        t[:id] = i
        t[:morning] = theme.morning.to_h
        t[:afternoon] = theme.afternoon.to_h
      end
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

      def morning_time_remaining
        morning.time_remaining
      end

      def afternoon_time_remaining
        afternoon.time_remaining
      end

      def morning_start_time
        now = DateTime.now
        DateTime.new(now.year, now.month, now.day + 1, 9, 0, 0, now.zone)
      end

      def afternoon_start_time
        now = DateTime.now
        DateTime.new(now.year, now.month, now.day + 1, 13, 0, 0, now.zone)
      end

      def scheduled_talks
        morning.scheduled_talks + afternoon.scheduled_talks
      end
    end

    class Session
      attr_accessor :time_remaining
      attr_reader :scheduled_talks

      def initialize(args={})
        @starting_time = set_starting_time(args[:starting_time])
        @time_remaining = args[:max_time]
        @scheduled_talks = []
      end

      def schedule_talk(talk)
        @scheduled_talks << ScheduledTalk.new(talk: talk, session: self)
        self.time_remaining = time_remaining - talk.duration
      end

      def next_start_time
        if last_talk = @scheduled_talks.last
          last_talk.start_time + last_talk.duration
        else
          0
        end
      end

      # Just sets it to 9am tomorrow for now
      def set_starting_time
        now = DateTime.now
        DateTime.new(now.year, now.month, now.day + 1, 9, 0, 0, now.zone)
      end
    end

    require 'forwardable'
    class ScheduledTalk
      extend Forwardable
      def_delegator :@talk, :duration

      attr_reader :session, :start_time

      def initialize(args={})
        @talk = args[:talk]
        @session = args[:session]
        set_start_time
      end

      def set_start_time
        @start_time = session.next_start_time
      end
    end
  end
end

# Thinking
#
# Create Theme A
#
# Talk one
# Fit talk into Theme A morning, or Theme B morning, or create new Theme B
#
# Talk two
# Fit talk into Theme
