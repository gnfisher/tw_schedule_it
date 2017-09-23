# TwScheduleIt

## Usage

    Note: You need a Ruby version > 2.0 installed to run this.

To install the gem, clone or copy the project, cd into it, and run:

    $ bundle exec rake install

To remove the gem

    $ gem uninstall tw_schedule_it-0.1.0.gem


Alternatively, you can clone this project, cd into it, and run the command line application as so:

    $ bundle exec tw_schedule_it <file>


To use the gem, you'll need to provide it a plain text file with one talk per line, formatted as so:

    Talk name (duration)

Duration should be in minutes, like this `30min` or for lightning talks of 5-minutes, you can simply put `lightning`. Here is a breif example:

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


## Notes on the Design and Development (en espanol)

Elige hacer la programa en formata de una gem. Es muy facil instalar y probar y aparte se hace la programa mas modular - con un `gem 'tw_schedule_it'` en el Gemfile de cualquier proyecto en el futuro, la funcionalidad esta disponible. Tambien incluye un ejecutable que envuelta la programa en un interfaz de CLI basica. Pero no sera muy dificil utilizar la funcionalidad en un aplicacion de Rails o Sinatra.

Un Evento es el principal entrada de interaccion con la programa, y deje la opcion de usar cualquier class que toma un array de objetos de Talk y responde al metodo de `build`. El class Schedule esta disenado especificamente al spec tecnical del code challenge pero capaz que un dia cambiara las necesidades.

Schedule utiliza el Decreasing First Fit Bin Algorithm para organizar los talks en Tematicas con una sesion de manana y una de tarde. Deje los clases subordinados (Theme, Session, ScheduledTalk) dentro de cuerpo de la Schedule class -- son utilizados unicamente por Schedule, y por ahora me parecia mejor mantener todo junto. En el futuro podemos sacarlos y utilizarlos en otro maneras, si hay necesidad.

Talks y TalkFactory trabajan juntos. TalkFactory toma un nested array de data de talks, y construye un array de objetos OpenStruct. Un talk es bastante simple como objeto, asi que fue mas rapido y facil hacerlo asi. Un OpenStruct es modificable (si hay necesidad en el futor) y sera muy simple usar un propio objeto Talk en el futuro si hay necesidad tambien, pasando el class como argumento.

Finalmente, hay un ImportFromFile class, que esta usado para leer un archivo de plain text con un formato como lo ejemplo de code challenge. El importacion de datos esta fuera de scope de un Event, utilizado solamente por el ejecutable CLI. Asi que un Event es


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tw_schedule_it. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TwScheduleIt project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/tw_schedule_it/blob/master/CODE_OF_CONDUCT.md).
