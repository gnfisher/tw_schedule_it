require "tw_schedule_it/tw_schedule_it/version"

module TwScheduleIt
  class CLI
    # $ schedule_it talks.txt
    # Event name:
    # Event description:
    # ...
    # Menu:
    # 1. View full schedule
    # 2. View full list of talks
    #
    def initialize(argv)
      puts argv
    end
  end
end
