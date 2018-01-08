require "spec_helper"

RSpec.describe TwScheduleIt::LineParser do
  context "#call" do
    it "returns an array with two elements, title and duration" do
      text = "First Talk Name 60min"

      talk_title, talk_duration = TwScheduleIt::LineParser.new(text).call

      expect(talk_title).to eq text
      expect(talk_duration).to eq 60
    end

    it "converts lightning talks to 5 minutes length" do
      text = "Talk Name lightning"

      talk_title, talk_duration = TwScheduleIt::LineParser.new(text).call

      expect(talk_duration).to eq 5
    end
  end
end
