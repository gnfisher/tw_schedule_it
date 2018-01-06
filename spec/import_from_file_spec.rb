require "spec_helper"

RSpec.describe TwScheduleIt::ImportFromFile do
  context ".load_from_path" do
    it "creates an array with each line's talk title and duration" do
      file_path = "spec/fixtures/talk_list.txt"
      parser = spy("parser")
      allow(TwScheduleIt::LineParser).to receive(:new).and_return(parser)
      allow(TwScheduleIt::TalksFactory).to receive(:build)

      TwScheduleIt::ImportFromFile.load_from_path(file_path)

      expect(TwScheduleIt::LineParser).to have_received(:new).exactly(5).times
      expect(TwScheduleIt::TalksFactory).to have_received(:build).once
    end
  end
end
