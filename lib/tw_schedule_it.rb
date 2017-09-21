require "tw_schedule_it/version"

require "tw_schedule_it/event"
require "tw_schedule_it/talks_factory"

module TwScheduleIt
  class App
    attr_reader :event

    def initialize(talks_file_path)
      talks_data = TwScheduleIt::ImportFromFile.build(talks_file_path)
      talks      = TwScheduleIt::TalksFactory.build(talks_data)
      @event     = TwScheduleIt::Event.new(talks: talks)
    end
  end
end
