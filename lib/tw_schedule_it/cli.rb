module TwScheduleIt
  class CLI
    def initialize(event)
      @event = event
    end

    def start
      schedule_event
      display_menu
    end

    private

    def display_menu
      options
      input = $stdin.gets.strip

      case input
      when /q/
        exit(0)
      when /1/
        print_schedule
      when /2/
        list_talks
      else
        puts "Invalid input."
        display_menu
      end
    end

    def options
      puts "\nOptions:"
      puts "(1) View Complete Schedule"
      puts "(2) View a List of Talks"
      puts "Press 'q' to Quit"
    end

    def schedule_event
      #@event.schedule_talks
      "Your event has been successfully scheduled."
    end

    def print_schedule
      # print out schedule
      display_menu
    end

    def list_talks
      # list talks
      display_menu
    end
  end
end
