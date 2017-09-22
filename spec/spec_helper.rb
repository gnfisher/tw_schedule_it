require "bundler/setup"
require "fakefs/spec_helpers"
require "pry"
require "tw_schedule_it"

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers, fakefs: true
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
