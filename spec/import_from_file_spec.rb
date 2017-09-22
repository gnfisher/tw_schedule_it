require "spec_helper"
require "tw_schedule_it/import_from_file"

RSpec.describe TwScheduleIt::ImportFromFile, fakefs: true do
  def stub_talks_data
    FileUtils.mkdir("/tmp")
    File.open("/tmp/talk_data.txt", "w") do |f|
      f.puts "Ruby on Rails Legacy App Maintenance 60min"
      f.puts "A World Without HackerNews 30min"
      f.puts "User Interface CSS in Rails Apps 30min"
      f.puts "Rails for Python Developers lightning"
    end
  end

  let(:expected_data) do
    [['Ruby on Rails Legacy App Maintenance', 60],
     ['A World Without HackerNews',           30],
     ['User Interface CSS in Rails Apps',     30],
     ['Rails for Python Developers',          5]]
  end

  it 'returns a nested array with the talk data' do
    stub_talks_data

    talk_data = TwScheduleIt::ImportFromFile.build('/tmp/talk_data.txt')
    expect(talk_data).to match_array(expected_data)
  end
end
