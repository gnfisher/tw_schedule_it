Feature: Take a plain text file of talk names and print out a schedule to terminal

  Scenario: User doesn't provide a plain text file with talk names and lengths
    When I run `tw_schedule_it`
    Then the output should contain "Error: You must pass a plain text file with the talk information as an argument to tw_schedule_it." 

  Scenario: When a valid file is provided it prints out the schedule on the screen
    Given a file named "talk_data" with:
    """
    Writing Fast Tests Against Enterprise Rails 60min
    Overdoing it in Python 45min
    Lua for the Masses 30min
    Ruby Errors from Mismatched Gem Versions 45min
    Common Ruby Errors 45min
    Rails for Python Developers lightning
    """
    When I run `tw_schedule_it talk_data`
    Then the output should contain "Theme 1:"
      
