require "spec_helper"
require "tw_schedule_it/schedule"

RSpec.describe TwScheduleIt::Schedule do
  let(:talks) do
    durations = [60, 45, 30, 5]
    20.times.map do |i|
      duration = durations.sample
      OpenStruct.new(title: "Talk #{i} #{duration}min", duration: duration)
    end
  end

  let(:schedule) { schedule = TwScheduleIt::Schedule.new(talks) }

  it "should schedule all talks" do
    scheduled_talks = schedule.themes.reduce(0) do |count, theme|
      count += theme.scheduled_talks.size
    end

    expect(talks.size).to eq(scheduled_talks)
  end

  it "#to_a returns the schedule in an array" do
    expect(schedule.to_a).to be_a(Array)
  end

  it "properly schedules talks into themes" do
    expect(schedule.to_a.size).to eq(2) # samples talks should be in at most 2 themes
  end

  # Maybe this test doesn't go here.
  it "doesn't over fill sessions" do
    schedule.themes.each do |theme|
      morning_talk_durations = theme.morning.scheduled_talks.reduce(0) { |d, talk| d + talk.duration }
      afternoon_talk_durations = theme.afternoon.scheduled_talks.reduce(0) { |d, talk| d + talk.duration }

      expect(morning_talk_durations).to be <= theme.morning.max_time
      expect(afternoon_talk_durations).to be <= theme.afternoon.max_time
    end
  end
end
