require "spec_helper"

RSpec.describe TwScheduleIt::LineParser do
  context "#call" do
    it "returns an array with two elements, title and duration" do
      text = "First Talk Name 60min"

      result = TwScheduleIt::LineParser.new(text).call

      expect(result[0]).to eq text
      expect(result[1]).to eq 60
    end

    it "converts lightning talks to 5 minutes length" do
      text = "Talk Name lightning"

      result = TwScheduleIt::LineParser.new(text).call

      expect(result[1]).to eq 5
    end
  end
end
