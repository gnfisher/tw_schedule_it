require "tw_schedule_it/version"
require "tw_schedule_it/event"
require "tw_schedule_it/import_from_file"
require "tw_schedule_it/schedule"
require "tw_schedule_it/talks"
require "tw_schedule_it/talks_factory"

# module TwScheduleIt
#   class App
#     attr_reader :talks_file_path, :event
#
#     def initialize(talks_file_path)
#       @talks_file_path = talks_file_path
#     end
#
#     private
#
#     def talks_data
#       TwScheduleIt::ImportFromFile.build(talks_file_path)
#     end
#
#     def event
#       @event ||= TwScheduleIt::Event.new(
#         talks: TwScheduleIt::TalksFactory.build(talks_data))
#     end
#   end
# end
