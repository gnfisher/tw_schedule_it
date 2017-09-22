require 'ostruct'
require 'tw_schedule_it/talks'

# Expects talk_data to be a nested array of talk titles and their durations in
# minutes.
#
# Example:
#
# talk_data =
#   [["First Talk Title",  30],
#    ["Second Talk Title", 60]]
module TwScheduleIt
  module TalksFactory
    def self.build(talks_data)
      talks = talks_data.map { |talk| create_talk(talk) }
      TwScheduleIt::Talks.new(talks)
    end

    def self.create_talk(talk_data)
      OpenStruct.new(
        title:    talk_data[0],
        duration: talk_data[1])
    end
  end
end
