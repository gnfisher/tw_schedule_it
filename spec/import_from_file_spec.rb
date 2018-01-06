require "spec_helper"
require "tw_schedule_it/import_from_file"

RSpec.describe TwScheduleIt::ImportFromFile do
  context ".build" do
    it "creates an array with each line's talk title and duration" do
      file_path = "spec/fixtures/talk_list.txt"
      imported_talks = TwScheduleIt::ImportFromFile.build(file_path)

      imported_talks.each do |talk|
        expect(talk.first).to be_a String
        expect(talk.last).to be_a Integer
      end
    end

    it "returns a nested array equal in size to number of talks in file" do
      file_path = "spec/fixtures/talk_list.txt"
      imported_talks = TwScheduleIt::ImportFromFile.build(file_path)

      result = imported_talks.size

      expect(result).to eq 5
    end

    it "ignores blank lines" do
      file_path = "spec/fixtures/talk_list_with_blank_lines.txt"
      imported_talks = TwScheduleIt::ImportFromFile.build(file_path)

      result = imported_talks.size

      expect(result).to eq 5
    end

    it "converts lightning talks to 5 minutes length" do
      file_path = "spec/fixtures/lightning_talks.txt"
      imported_talks = TwScheduleIt::ImportFromFile.build(file_path)

      result = imported_talks.first

      expect(result.first).to be_a String
      expect(result.last).to be_a Integer

    end
  end
end
