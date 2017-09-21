require "spec_helper"
require "tw_schedule_it/talks"

RSpec.describe TwScheduleIt::Talks do
  it 'should respond to #each' do
    talks = TwScheduleIt::Talks.new([1,2,3])
    expect(talks).to respond_to(:each)
  end
end
