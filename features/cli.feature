Feature: Take a plain text file of talk names and lengths and prompt user for event name

  Scenario: User doesn't provide a plain text file with talk names and lengths
    When I run `tw_schedule_it`
    Then the output should contain "Error: You must pass a plain text file with the talk information as an argument to tw_schedule_it." 
      
