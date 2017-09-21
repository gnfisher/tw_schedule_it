require "spec_helper"

RSpec.describe TwScheduleIt::ImportFromFile do
  let(:data) do
    [['Why The Prequels Almost Ruined Star Wars', '60'],
     ['Reading And Writing Basic',                '30'],
     ['The Science of Star Destroyers',           '5']]
  end

  it 'returns a nested array with the talk data' do
    allow(File).to receive(:readlines)
    talk_data = TwScheduleIt::ImportFromFile(file_path)

    # TODO:
    # bundle install fakefs, then set up the fake file action
    # for the path i pass in, see https://www.bignerdranch.com/blog/fake-it/
  end
end
