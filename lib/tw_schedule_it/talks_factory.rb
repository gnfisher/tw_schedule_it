require 'ostruct'

# Expects talk_data to be a nested array of talk titles and their durations in
# minutes. See the following example:
#
# talk_data =
#   [["First Talk Title",  30],
#    ["Second Talk Title", 60]]
module TwScheduleIt
  module TalksFactory
    def self.build(talks_data, talk_class = OpenStruct)
      talks = talks_data.map { |talk| create_talk(talk, talk_class) }
      TwScheduleIt::Talks.new(talks)
    end

    private

    def self.create_talk(talk_data, talk_class)
      talk_class.new(
        title:    talk_data[0],
        duration: talk_data[1])
    end
  end
end
