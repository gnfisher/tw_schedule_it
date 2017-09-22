require "spec_helper"
require "tw_schedule_it/schedule"
require "pry"

RSpec.describe TwScheduleIt::Schedule do
  let(:talks) do
    durations = [60, 45, 30, 5]
    20.times.map do |i|
      OpenStruct.new(title: "Talk #{i}", duration: durations.sample)
    end
  end

  it "should schedule all talks" do
    schedule = TwScheduleIt::Schedule.new(talks)

    scheduled_talks = schedule.themes.reduce(0) do |count, theme|
      count += theme.scheduled_talks.size
    end

    expect(talks.size).to eq(scheduled_talks)
  end

  it "should return the schedule as a hash" do
    # {
    #   theme_1: {
    #     morning: [
    #       { title: '', start_time: '11:30am' }
    #     ]
    #   }
    # }

  end
end
