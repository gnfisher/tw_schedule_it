module TwScheduleIt
  class LineParser
    def initialize(line)
      @line = line
    end

    def call
      [title, duration]
    end

    private

    def title
      @line.strip
    end

    def duration
      if not_lightning?
        duration_from_line
      else
        duration_for_lightning
      end
    end

    def not_lightning?
      /\d/ =~ @line
    end

    def duration_from_line
      @line[/\d+/].strip.to_i
    end

    def duration_for_lightning
      5
    end
  end
end
