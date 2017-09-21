require "spec_helper"
require "tw_schedule_it/talks_factory"

RSpec.describe TwScheduleIt::TalksFactory do
  describe '#build_from_file' do
    let(:data) do
      [['Why The Prequels Almost Ruined Star Wars', '60'],
       ['Reading And Writing Basic',                '30'],
       ['The Science of Star Destroyers',           '5']]
    end

    context 'when a properly formatted file is provided' do
      it 'returns a Talks object' do
        talks = TwScheduleIt::TalksFactory.build(data)
        expect(talks).to be_instance_of(TwScheduleIt::Talks)
      end
    end
  end
end

