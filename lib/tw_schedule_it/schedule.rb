require "forwardable"
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
  end
end
