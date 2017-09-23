require "spec_helper"
require "tw_schedule_it/import_from_file"

# The following allows pry to work with fakefs while debugging.
Pry.config.history.should_save = false
Pry.config.history.should_load = false

RSpec.describe TwScheduleIt::ImportFromFile, fakefs: true do
  def stub_talks_data(data)
    FileUtils.mkdir("/tmp")
    File.open("/tmp/talk_data.txt", "w") do |f|
      data.each { |line| f.puts "#{line[0]}" }
    end
  end

  let(:expected_data) do
    [['Ruby on Rails Legacy App Maintenance 60min', 60],
     ['A World Without HackerNews 30min',           30],
     ['User Interface CSS in Rails Apps 30min',     30],
     ['Rails for Python Developers lightning',       5]]
  end

  it 'returns a nested array with the talk data' do
    stub_talks_data(expected_data)

    talk_data = TwScheduleIt::ImportFromFile.build('/tmp/talk_data.txt')
    expect(talk_data).to match_array(expected_data)
  end

  it 'skips blank lines' do
    data = expected_data << ["\n", 0]
    stub_talks_data(data)
    talk_data = TwScheduleIt::ImportFromFile.build('/tmp/talk_data.txt')

    expect(talk_data.last.first).not_to be_empty
  end
end
