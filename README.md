# TwScheduleIt

## Usage

    Note: You need a Ruby version > 2.0 installed to run this.


To install the gem, clone or copy the project, cd into it, and run:

    $ bin/setup

    $ rake build

    $ gem install pkg/tw_schedule_it-0.1.0.gem

To use the program

    $ tw_schedule_it <filepath>

To remove the gem

    $ gem uninstall tw_schedule_it

Alternatively, you can clone this project, cd into it, and run the CLI app directly:

    $ bin/setup

Then run the progam

    $ bundle exec exe/tw_schedule_it <filepath>

or

    $ ruby exe/tw_schedule_it <filepath>

To use the gem, you'll need to provide it a plain text file with one talk per line, formatted as so:

    Talk name (duration)

Duration should be in minutes, like this `30min` or for lightning talks of 5-minutes, you can simply put `lightning`. Here is a brief example:

    Writing Fast Tests Against Enterprise Rails 60min
    Overdoing it in Python 45min
    Lua for the Masses 30min
    Ruby Errors from Mismatched Gem Versions 45min
    Common Ruby Errors 45min
    Rails for Python Developers lightning

To run tests

    $ rake features

and

    $ rake spec

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tw_schedule_it. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TwScheduleIt project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tw_schedule_it/blob/master/CODE_OF_CONDUCT.md).
