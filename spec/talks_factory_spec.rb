require "spec_helper"
require "tw_schedule_it/talks_factory"

RSpec.describe TwScheduleIt::TalksFactory do
  describe '#build' do
    it 'creates a talk from each nested array' do
      talks_in_file_count = imported_talk_data.size
      talks = TwScheduleIt::TalksFactory.build(imported_talk_data)

      result = talks.size

      expect(result).to eq(talks_in_file_count)
    end
  end

  def imported_talk_data
    [
      ['Why The Prequels Almost Ruined Star Wars', '60'],
      ['Reading And Writing Basic',                '30'],
      ['The Science of Star Destroyers',           '5']
    ]
  end
end

