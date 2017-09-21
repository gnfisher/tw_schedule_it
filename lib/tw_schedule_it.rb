require "tw_schedule_it/version"

require "tw_schedule_it/event"
require "tw_schedule_it/talks_factory"

module TwScheduleIt
  class App
    attr_reader :event

    def initialize(talks_file_path)
      @event = TwScheduleIt::Event.new(
        talks: TalksFactory.build_from_file(talks_file_path))
    end
  end
end
